<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
</head>
<body>
    <h1>Add Product</h1>
    <form action="save_product.php" method="POST" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" name="name" required>
        <label for="category">Category:</label>
        <select name="category_id">
            <?php
            include 'pos_db.php';
            $result = $conn->query("SELECT * FROM categories");
            while ($row = $result->fetch_assoc()) {
                echo "<option value='{$row['category_id']}'>{$row['category_name']}</option>";
            }
            ?>
        </select>
        <label for="image">Product Image:</label>
        <input type="file" name="image" required>
        <button type="submit">Add Product</button>
    </form>
</body>
</html>
