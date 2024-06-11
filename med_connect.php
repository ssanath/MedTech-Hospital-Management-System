<?php
    $PID = $_POST['pid'];
    $Diagnosis = $_POST['dia'];
    $RID = $_POST['rid'];
    $Medication = $_POST['med'];

    $conn = new mysqli('db','root','','hospital_management');
    if($conn->connect_error){
        die("Connection failed : ".$conn->connect_error);
    }
    else
    {
        $stmt = $conn->prepare("insert into medical_record(PID,Diagnosis,RID,Medication)
        values(?,?,?,?)");
        $stmt->bind_param("isis",$PID,$Diagnosis,$RID,$Medication);
        $stmt->execute();
        echo "Record added...";
        $stmt->close();
        $conn->close();
    }
?>