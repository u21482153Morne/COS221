<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

// Function to return a JSON error object
function jsonResponseError($message) {
    return json_encode([
        'status' => 'error',
        'timestamp' => time(),
        'data' => $message
    ]);
}

// Check if the POST data is empty
$postData = json_decode(file_get_contents('php://input'), true);
if (empty($postData)) {
    echo jsonResponseError('Error. Post parameters are missing');
    exit();
}

class Database {
    private static $instance = null;
    private $connection;

    private $servername = "127.0.0.1";
    private $username = "root";
    private $password = "";
    private $dbname = "users_local";

    private function __construct() {
        $this->connection = new mysqli($this->servername, $this->username, $this->password, $this->dbname);

        if ($this->connection->connect_error) {
            die(json_encode([
                'status' => 'error',
                'data' => 'Connection to the database failed'
            ]));
        }
    }

    public static function getInstance() {
        if (self::$instance == null) {
            self::$instance = new Database();
        }

        return self::$instance;
    }

    public function query($query) {
        return $this->connection->query($query);
    }

    public function prepare($query) {
        return $this->connection->prepare($query);
    }

}

class API {

    public function validateApiKey($apikey) {
        $db = Database::getInstance();
        $stmt = $db->prepare("SELECT COUNT(*) as count FROM users WHERE api = ?");
        $stmt->bind_param('s', $apikey);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        return $row['count'] > 0;
    }

    public function getAllWine($return, $limit = 500, $sort = null, $order = 'ASC', $fuzzy = true, $search = []) { // change
        $db = Database::getInstance();

        $columns = implode(',', $return);
        $query = "SELECT $columns FROM wines"; // change

        $conditions = [];
        $params = '';
        $param_values = [];
        foreach ($search as $column => $value) {
            $operator = $fuzzy ? 'LIKE' : '=';
            $searchValue = $fuzzy ? '%' . $value . '%' : $value;
            $conditions[] = "$column $operator ?";
            $params .= 's';
            $param_values[] = $searchValue;
        }

        if (!empty($conditions)) {
            $query .= ' WHERE ' . implode(' AND ', $conditions);
        }

        if ($sort !== null) {
            $query .= " ORDER BY $sort $order";
        }

        $query .= " LIMIT ?";
        $params .= 'i';
        $param_values[] = $limit;

        $stmt = $db->prepare($query);
        $stmt->bind_param($params, ...$param_values);
        $stmt->execute();
        $result = $stmt->get_result();

        $wine = []; // change

        while ($row = $result->fetch_assoc()) {
            $wine[] = $row; // change
        }

        return [
            'status' => 'success',
            'data' => $wine, // change
            'timestamp' => time()
        ];

    }

    public function getAllWineries($return, $limit = 500, $sort = null, $order = 'ASC', $fuzzy = true, $search = []) {
        $db = Database::getInstance();

        $columns = implode(',', $return);
        $query = "SELECT $columns FROM winery";

        $conditions = [];
        $params = '';
        $param_values = [];
        foreach ($search as $column => $value) {
            $operator = $fuzzy ? 'LIKE' : '=';
            $searchValue = $fuzzy ? '%' . $value . '%' : $value;
            $conditions[] = "$column $operator ?";
            $params .= 's';
            $param_values[] = $searchValue;
        }

        if (!empty($conditions)) {
            $query .= ' WHERE ' . implode(' AND ', $conditions);
        }

        if ($sort !== null) {
            $query .= " ORDER BY $sort $order";
        }

        $query .= " LIMIT ?";
        $params .= 'i';
        $param_values[] = $limit;

        $stmt = $db->prepare($query);
        $stmt->bind_param($params, ...$param_values);
        $stmt->execute();
        $result = $stmt->get_result();

        $wineries = [];

        while ($row = $result->fetch_assoc()) {
            $wineries[] = $row;
        }

        return [
            'status' => 'success',
            'data' => $wineries,
            'timestamp' => time()
        ];
    }

    public function insertReview($apikey, $wineName, $rating) {
        $db = Database::getInstance();

        // Get the userID from the apikey
        $stmt = $db->prepare("SELECT id FROM users WHERE api = ?");
        $stmt->bind_param('s', $apikey);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        $userId = $user['id'];

        // Get the WineID from the wine name
        $stmt = $db->prepare("SELECT WineID FROM wines WHERE Name = ?");
        $stmt->bind_param('s', $wineName);
        $stmt->execute();
        $result = $stmt->get_result();
        $wine = $result->fetch_assoc();
        $wineId = $wine['WineID'];

        // Check if a review by this user for this wine already exists
        $stmt = $db->prepare("SELECT * FROM reviews WHERE WineID = ? AND UserID = ?");
        $stmt->bind_param('ii', $wineId, $userId);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) { // If a review exists, update it
            $stmt = $db->prepare("UPDATE reviews SET rating = ? WHERE WineID = ? AND UserID = ?");
            $stmt->bind_param('iii', $rating, $wineId, $userId);
            if ($stmt->execute()) {
                return json_encode([
                    'status' => 'success',
                    'timestamp' => time(),
                    'data' => 'Review updated successfully'
                ]);
            } else {
                return json_encode([
                    'status' => 'error',
                    'timestamp' => time(),
                    'data' => 'Failed to update review'
                ]);
            }
        } else { // If a review doesn't exist, insert a new one
            $stmt = $db->prepare("INSERT INTO reviews (WineID, UserID, rating) VALUES (?, ?, ?)");
            $stmt->bind_param('iii', $wineId, $userId, $rating);
            if ($stmt->execute()) {
                return json_encode([
                    'status' => 'success',
                    'timestamp' => time(),
                    'data' => 'Review submitted successfully'
                ]);
            } else {
                return json_encode([
                    'status' => 'error',
                    'timestamp' => time(),
                    'data' => 'Failed to submit review'
                ]);
            }
        }
    }


}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if (!isset($input['apikey']) || !isset($input['type']) || !isset($input['return'])) {
        echo json_encode([
            'status' => 'error',
            'data' => 'Missing required parameters.'
        ]);
        exit();
    }

    $apikey = $input['apikey'];
    $type = $input['type'];
    $return = $input['return'];

    $api = new API();

    if (!$api->validateApiKey($apikey)) {
        echo json_encode([
            'status' => 'error',
            'data' => 'Invalid API key',
            'timestamp' => time()
        ]);
        exit();
    }

    switch ($type) {
        case 'GetAllWine':
            if ($return === '*') {
                $return = ['WineID', 'WineryID', 'Name', 'Type', 'Rating', 'Price', 'Year', 'Region', 'Acidity', 'AlcoholContent', 'Description', 'Season', 'Grape', 'Image'];
            }

            $limit = isset($input['limit']) ? (int)$input['limit'] : 500;
            $sort = isset($input['sort']) ? $input['sort'] : null;
            $order = isset($input['order']) && strtoupper($input['order']) === 'DESC' ? 'DESC' : 'ASC';
            $fuzzy = isset($input['fuzzy']) ? (bool)$input['fuzzy'] : true;
            $search = isset($input['search']) ? (array)$input['search'] : [];

            echo json_encode($api->getAllWine($return, $limit, $sort, $order, $fuzzy, $search) + ['timestamp' => time()]); // change
            break;

        case 'GetAllWineries':
            if ($return === '*') {
                $return = ['WineryID', 'Name', 'Verified', 'Country', 'Province', 'Town', 'Image'];
            }

            $limit = isset($input['limit']) ? (int)$input['limit'] : 500;
            $sort = isset($input['sort']) ? $input['sort'] : null;
            $order = isset($input['order']) && strtoupper($input['order']) === 'DESC' ? 'DESC' : 'ASC';
            $fuzzy = isset($input['fuzzy']) ? (bool)$input['fuzzy'] : true;
            $search = isset($input['search']) ? (array)$input['search'] : [];

            echo json_encode($api->getAllWineries($return, $limit, $sort, $order, $fuzzy, $search) + ['timestamp' => time()]);
            break;

        case 'InsertReview':
            if (!isset($input['wine']) || !isset($input['rating'])) {
                echo json_encode([
                    'status' => 'error',
                    'data' => 'Missing wine or rating.',
                    'timestamp' => time()
                ]);
                exit();
            }

            $wineName = $input['wine'];
            $rating = $input['rating'];
            echo $api->insertReview($apikey, $wineName, $rating);
            break;

        default:
            echo json_encode([
                'status' => 'error',
                'data' => 'Invalid request type',
                'timestamp' => time()
            ]);
            break;
    }
} else {
    echo json_encode([
        'status' => 'error',
        'data' => 'Invalid request method',
        'timestamp' => time()
    ]);
}
?>