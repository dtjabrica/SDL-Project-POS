<!-- save_product.php -->
<?php
include 'pos_db.php';

$name = $_POST['name'];
$category_id = $_POST['category_id'];
$image = $_FILES['image'];

// Image upload directory
$target_dir = "uploads/products/";
if (!is_dir($target_dir)) {
    mkdir($target_dir, 0777, true);
}

$target_file = $target_dir . basename($image["name"]);
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
$check = getimagesize($image["tmp_name"]);
if ($check === false) {
    $error = "File is not an image.";
    header("Location: add_product.php?error=" . urlencode($error));
    exit();
}

// Check file size (optional)
if ($image["size"] > 500000) {
    $error = "Sorry, your file is too large.";
    header("Location: add_product.php?error=" . urlencode($error));
    exit();
}

// Allow certain file formats (optional)
$allowed_types = array('jpg', 'jpeg', 'png', 'gif');
if (!in_array($imageFileType, $allowed_types)) {
    $error = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    header("Location: add_product.php?error=" . urlencode($error));
    exit();
}

// Move the uploaded file to the target directory
if (!move_uploaded_file($image["tmp_name"], $target_file)) {
    $error = "Sorry, there was an error uploading your file.";
    header("Location: add_product.php?error=" . urlencode($error));
    exit();
}

$image_path = $target_file;

$sql = "INSERT INTO products (name, image, category_id) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssi", $name, $image_path, $category_id);

if ($stmt->execute()) {
    echo "New product created successfully";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
