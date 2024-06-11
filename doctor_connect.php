<?php
    $conn = new mysqli('db','root','','hospital_management');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $doctorName = $_POST['name'];

// Prepare and execute a query to fetch data based on the doctor's name
$stmt = $conn->prepare("SELECT * FROM doctor WHERE DocName LIKE ?");
$stmt->bind_param("s", $doctorName);
$stmt->execute();
$result = $stmt->get_result();

// Fetch the result into an associative array
$data = $result->fetch_all(MYSQLI_ASSOC);

// Close the database connection
$stmt->close();
$conn->close();

// Return the result as JSON
header('Content-Type: application/json');
echo json_encode($data);
?>