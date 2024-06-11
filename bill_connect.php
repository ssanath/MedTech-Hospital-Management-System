<?php
    $PID = $_POST['pid'];
    $Fees = $_POST['fees'];
    $DID = $_POST['did'];
    $Insurance = $_POST['ins'];

    $conn = new mysqli('db','root','','hospital_management');
    if($conn->connect_error){
        die("Connection failed : ".$conn->connect_error);
    }
    else
    {
        if($Insurance == "yes")
        {
            $Discount = $Fees * 0.25;
            $Fees = $Fees - $Discount;
        }
        $stmt = $conn->prepare("insert into billings(DID,Fees,Insurance,PID)
        values(?,?,?,?)");
        $stmt->bind_param("iisi",$DID,$Fees,$Insurance,$PID);
        $stmt->execute();
        echo "PID: " . $PID . "<br>";
        echo "DID:" . $DID . "<br>";
        echo "Fees:" . $Fees . "<br>";
        echo "Updated succesfully";
        $stmt->close();
        $conn->close();
    }
?>