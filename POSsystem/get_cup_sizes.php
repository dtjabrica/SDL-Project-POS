<?php
include 'pos_db.php'; // Include database connection

$category_id = $_GET['category_id'];
$result = $conn->query("SELECT * FROM cup_sizes WHERE category_id = $category_id");

$options = "<option value=''>Select Cup Size</option>";
while ($row = $result->fetch_assoc()) {
    $options .= "<option value='{$row['id']}'>{$row['size_name']} - \${$row['price']}</option>";
}

echo $options;
?>