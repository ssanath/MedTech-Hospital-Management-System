<?php
    $PID = $_POST['pid'];
    $Date = $_POST['dt'];
    $DID = $_POST['did'];
    $AppID = $_POST['appid'];

    $conn = new mysqli('db','root','','hospital_management');
    if($conn->connect_error){
        die("Connection failed : ".$conn->connect_error);
    }
    else
    {
        $stmt = $conn->prepare("insert into appointments(Date,PID,DID,AppID)
        values(?,?,?,?)");
        $stmt->bind_param("siii",$Date,$PID,$DID,$AppID);
        $stmt->execute();
        echo "Appointment Successfull...";
        $stmt->close();
        $conn->close();
    }
?>