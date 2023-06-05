<?php

header("Content-Type: application/json");

include "header.php";

$newApi = api::instance();

$request_body = file_get_contents('php://input');

if (!empty($request_body)) {
    $data = json_decode($request_body);
} else {
    $data = null;
}


if (!empty($data)) {
    if (isset($data->type) && $data->type === "GetAllData") {
        $newApi->GetAllData($data);
    } else {
        if (isset($data->type) && $data->type === "Search") {
            $newApi->search($data);
        } else {
            echo $newApi->error("No type");
        }
    }
} else {
    if (empty($data)) {
        echo $newApi->error("No data");
    }
}
class api
{
    public $connection;
    public $useLimit;
    public $useOrder = "ASC";
    public static function instance()
    {

        static $instance = null;
        if ($instance === null)
            $instance = new api();
        return $instance;
    }


    private function __construct()
    {
        $_host = "wheatley.cs.up.ac.za";
        $db_user = "u21598012";
        $db_pass = "3QZBZJIPYREK3OWVR4DONJBS4PGGXKCZ";
        $this->connection = new mysqli($_host, $db_user, $db_pass);

        if ($this->connection->connect_error)
            die("Connection failure: " . $this->connection->connect_error);
        else {
            $this->connection->select_db("u21598012");
        }
    }

    private function __destruct()
    {
        $this->connection->close();
    }

    public function getAllData($input)
    {
        if (!isset($input->type)) {
            $this->error("No type");
        }

        $query = "SELECT ";
        $query .= "* FROM Wines";

        if (isset($input->limit)) {
            $query .= " LIMIT " . $input->limit;
        }

        $result = $this->connection->query($query);

        $output = mysqli_fetch_all($result, MYSQLI_ASSOC);

        $returnjson = array("status" => "success", "timestamp" => time(), "data" => $output);
        echo json_encode($returnjson);
    }



    public function search($input)
    {
        $query = "SELECT ";

        if (isset($input->search)) {
            $query .= " WHERE ";
            $searcharray = array();
            foreach ($input->search as $key => $value) {
                if (isset($input->fuzzy) && $input->fuzzy == false) {
                    array_push($searcharray, $key . "='" . $value . "'");
                } else {
                    array_push($searcharray, $key . " LIKE '%" . $value . "%'");
                }
            }
            $query .= implode(" AND ", $searcharray);
        }
        $query .= " FROM Wines";
        $result = $this->connection->query($query);
        $output = mysqli_fetch_all($result, MYSQLI_ASSOC);

        $returnjson = array("status" => "success", "timestamp" => time(), "data" => $output);
        echo json_encode($returnjson);

    }

    function sanitizeVariable($variable)
    {
        $variable = trim($variable);
        $variable = stripslashes($variable);
        $variable = htmlspecialchars($variable, ENT_QUOTES);
        return $variable;
    }

    function valAPI($apiKey)
    {
        $sql = "SELECT * FROM PA03 WHERE API_Key='" . $apiKey . "'";
        $results = $this->connection->query($sql);
        $row = $results->fetch_assoc();
        return (is_array($row) && count($row) > 0);
    }

    function error($msg)
    {
        $error = array("status" => "error", "timestamp" => time(), "data" => $msg);
        echo json_encode($error);
        die();
    }
}