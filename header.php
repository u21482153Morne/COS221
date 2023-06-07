<?php session_start(); ?>
<header>
    <link rel="stylesheet" href="../themes.css">
    <nav class="row">
        <img src="img/logo_dark.png" alt="Global Wine Store logo" class="logo" id="logo-dark">
        <img src="img/logo_light.png" alt="Global Wine Store logo" class="logo" id="logo-light">
        <ul class="main-nav">
            <li><a href="../Wines/index.php">Wine</a></li>
            <li><a href="../Wineries/Wineries.php">Wineries</a></li>
            <li><a href="../FindWinary/FindWinary.php">Find Wineries</a></li>
        </ul>
        <ul class="auth-nav">
            <?php if (!isset($_SESSION['user_id'])): ?>
                <li><a href="../LogIn/login.php">Login</a></li>
                <li><a href="../SignUp/signup.php">Register</a></li>
            <?php else: ?>
                <li><?php echo htmlspecialchars($_SESSION["user_name"]); ?></li>
                <li><a href="../LogIn/logout.php">Logout</a></li>
            <?php endif; ?>
        </ul>
        <ul class="showcase">
            <form class="searchbar">
                <input type="search" name="search" placeholder="Search.." id="search-input">
                <input type="submit" value="&#xf002;" class="search-button fa">
            </form>
        </ul>
    </nav>
</header>
