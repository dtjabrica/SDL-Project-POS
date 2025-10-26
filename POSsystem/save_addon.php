<!-- save_addon.php -->
<?php
include 'pos_db.php';

$name = $_POST['name'];
$price = $_POST['price'];
$image = $_FILES['image'];

// Debugging: Check if file upload is successful
if ($image['error'] !== UPLOAD_ERR_OK) {
    die("Upload failed with error code " . $image['error']);
}

// Image upload directory
$target_dir = "uploads/addons/";
if (!is_dir($target_dir)) {
    mkdir($target_dir, 0777, true);
}

$target_file = $target_dir . basename($image["name"]);
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
$check = getimagesize($image["tmp_name"]);
if ($check === false) {
    die("File is not an image.");
}

// Check file size (optional)
if ($image["size"] > 500000) {
    die("Sorry, your file is too large.");
}

// Allow certain file formats (optional)
$allowed_types = array('jpg', 'jpeg', 'png', 'gif');
if (!in_array($imageFileType, $allowed_types)) {
    die("Sorry, only JPG, JPEG, PNG & GIF files are allowed.");
}

// Move the uploaded file to the target directory
if (!move_uploaded_file($image["tmp_name"], $target_file)) {
    die("Sorry, there was an error uploading your file.");
}

$image_path = $target_file;

$sql = "INSERT INTO addons (name, price, image) VALUES ('$name', '$price', '$image_path')";

if ($conn->query($sql) === TRUE) {
    echo "New add-on created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>