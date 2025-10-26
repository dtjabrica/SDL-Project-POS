<!-- add_addon.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Add-on</title>
</head>
<body>
    <h1>Add Add-on</h1>
    <form action="save_addon.php" method="POST" enctype="multipart/form-data">
        <label for="name">Add-on Name:</label>
        <input type="text" name="name" required>
        <label for="price">Price:</label>
        <input type="text" name="price" required>
        <label for="image">Add-on Image:</label>
        <input type="file" name="image" required>
        <button type="submit">Add Add-on</button>
    </form>
</body>
</html>