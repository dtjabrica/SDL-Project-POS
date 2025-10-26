<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Cup Size</title>
</head>
<body>
    <h1>Add Cup Size</h1>
    <form action="save_cup_size.php" method="POST">
        <label for="category_id">Category:</label>
        <select name="category_id" required>
            <?php
            include 'pos_db.php'; // Include database connection
            $result = $conn->query("SELECT * FROM categories");
            while ($row = $result->fetch_assoc()) {
                echo "<option value='{$row['category_id']}'>{$row['category_name']}</option>";
            }
            ?>
        </select>
        <label for="size_name">Cup Size Name:</label>
        <input type="text" name="size_name" required>
        <label for="price">Price:</label>
        <input type="text" name="price" required>
        <button type="submit">Add Cup Size</button>
    </form>
</body>
</html>
