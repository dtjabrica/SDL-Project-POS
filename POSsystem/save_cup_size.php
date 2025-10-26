<?php
include 'pos_db.php'; // Include your database connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $categoryId = $_POST['category_id'];
    $sizeName = $_POST['size_name'];
    $price = $_POST['price'];

    // Insert the cup size into the database
    $stmt = $conn->prepare("INSERT INTO cup_sizes (category_id, size_name, price) VALUES (?, ?, ?)");
    $stmt->bind_param("isd", $categoryId, $sizeName, $price);

    if ($stmt->execute()) {
        echo "New cup size added successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Redirect back to the main page or show a success message
    header("Location: index.php");
    exit();
}
?>
