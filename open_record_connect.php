<?php
    $conn = new mysqli('localhost:3310','root','','hospital_management');
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $PatientName = $_POST['fname'];

// Prepare and execute a query to fetch data based on the doctor's name
$stmt = $conn->prepare("SELECT * FROM patient, doctor, appointments, medical_record 
            WHERE patient.PID = appointments.PID 
            AND appointments.DID = doctor.DocID 
            AND medical_record.PID = patient.PID AND patient.FirstName LIKE ?");
$stmt->bind_param("s", $PatientName);
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