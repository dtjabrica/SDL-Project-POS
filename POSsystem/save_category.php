<!-- save_category.php -->
<?php
include 'pos_db.php';

$category_name = $_POST['category_name']; // Corrected to use 'category_name'

$sql = "INSERT INTO categories (category_name) VALUES ('$category_name')"; // Corrected to use 'category_name'

if ($conn->query($sql) === TRUE) {
    echo "New category created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
