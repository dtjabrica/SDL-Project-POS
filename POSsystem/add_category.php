<!-- add_category.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
</head>
<body>
    <h1>Add Category</h1>
    <form action="save_category.php" method="POST">
        <label for="name">Category Name:</label>
        <input type="text" name="category_name" required>
        <button type="submit">Add Category</button>
    </form>
</body>
</html>