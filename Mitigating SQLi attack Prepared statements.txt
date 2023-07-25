$username= $_GET['user']; // Set parameter
$stmt = $conn->prepare("SELECT * FROM Users WHERE name = '?'"); // Prepare statement
$stmt->bind_param("s", $username); // Bind parameter to SQL query
$stmt->execute(); // Execute the SQL query