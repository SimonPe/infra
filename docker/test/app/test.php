<?php
$con=mysqli_connect("mysql","magento","magento","test");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// Create table
$sql="CREATE TABLE Persons(FirstName CHAR(30),LastName CHAR(30),Age INT)";

// Execute query
if (mysqli_query($con,$sql)) {
  echo "Table persons created successfully";
} else {
  echo "Error creating table: " . mysqli_error($con);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	// escape variables for security
	$firstname = mysqli_real_escape_string($con, $_POST['firstname']);
	$lastname = mysqli_real_escape_string($con, $_POST['lastname']);
	$age = mysqli_real_escape_string($con, $_POST['age']);

	$sql="INSERT INTO Persons (FirstName, LastName, Age)
	VALUES ('$firstname', '$lastname', '$age')";

	if (!mysqli_query($con,$sql)) {
	  die('Error: ' . mysqli_error($con));
	}
	echo "1 record added";

}




mysqli_close($con);
?> 

<html>
<body>

<form action="test.php" method="post">
Firstname: <input type="text" name="firstname">
Lastname: <input type="text" name="lastname">
Age: <input type="text" name="age">
<input type="submit">
</form>

</body>
</html> 