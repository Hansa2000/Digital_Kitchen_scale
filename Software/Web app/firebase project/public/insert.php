<?php
// Connect to your MySQL database
$servername = "localhost";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check for errors
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Get the values from the AJAX request
$value1 = $_POST['value1'];
$value2 = $_POST['value2'];

// Insert the values into your database
$sql = "INSERT INTO your_table (value1, value2) VALUES ('$value1', '$value2')";
if ($conn->query($sql) === TRUE) {
  echo "Values inserted successfully";
} else {
  echo "Error inserting values: " . $conn->error;
}

// Close the database connection
$conn->close();
?>
