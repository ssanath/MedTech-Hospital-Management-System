<?php
    $FirstName = $_POST['fname'];
    $LastName = $_POST['lname'];
    $Address = $_POST['add']; 
    $Age = $_POST['age'];
    $PID = $_POST['id'];
    $Gender = $_POST['gender'];
    $Ph_No = $_POST['phno'];

    $conn = new mysqli('db','root','','hospital_management');
    if($conn->connect_error){
        die("Connection failed : ".$conn->connect_error);
    }
    else
    {
        $stmt = $conn->prepare("insert into patient(FirstName,LastName,Address,Age,PID,Gender,Ph_No)
        values(?,?,?,?,?,?,?)");
        if (!$stmt) {
            die("Error in preparing statement: " . $conn->error);
        }
        $stmt->bind_param("sssiiss",$FirstName,$LastName,$Address,$Age,$PID,$Gender,$Ph_No);
        #$stmt->execute();
        if (!$stmt->execute()) {
            die("Error in executing statement: " . $stmt->error);
        }
        echo "Registration Successfull...";
        $stmt->close();
        $conn->close();
    }
?>