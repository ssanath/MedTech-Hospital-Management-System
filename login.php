<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the submitted username and password
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Define an array of valid username-password pairs
    $validCredentials = [
        "sanath" => "1234",
        "moulya" => "5678"
        // Add more username-password pairs as needed
    ];

    // Check if the entered username exists and the password is correct
    if (array_key_exists($username, $validCredentials) && $password == $validCredentials[$username]) {
        // If yes, redirect to the home page
        header("Location: index.html");
        exit();
    } else {
        // If no, display an error message (you can customize this part)
        echo "Incorrect username or password.";
    }
}
?>
