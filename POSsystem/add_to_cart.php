<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if product ID and quantity are provided
    if (!isset($_POST['product_id']) || !isset($_POST['product_quantity'])) {
        // Redirect back to index.php with an error message
        header("Location: index.php?error=Please%20select%20a%20product%20and%20quantity");
        exit();
    }

    $product_id = $_POST['product_id'];
    $quantity = $_POST['product_quantity'];
    $cup_size_id = isset($_POST['cup_size_id']) ? intval($_POST['cup_size_id']) : null;
    $addon_id = isset($_POST['addon_id']) ? $_POST['addon_id'] : null;
    $addon_quantity = isset($_POST['addon_quantity']) ? $_POST['addon_quantity'] : null;
    $sugar_level_id = isset($_POST['sugar_level_id']) ? $_POST['sugar_level_id'] : null; // Define sugar_level_id

    include 'pos_db.php';

    // Retrieve addon information
    $addon = null;
    $addon_image = null; // Initialize addon image variable
    $addon_name = null; // Initialize addon name variable
    if ($addon_id !== null) {
        $addon_query = "SELECT * FROM addons WHERE id = ?";
        $stmt = $conn->prepare($addon_query);
        $stmt->bind_param("i", $addon_id);
        $stmt->execute();
        $addon_result = $stmt->get_result();
        $addon = $addon_result->fetch_assoc();
        $addon_image = $addon ? $addon['image'] : null; // Retrieve addon image data
        $addon_name = $addon ? $addon['name'] : null; // Retrieve addon name
    }

    // If cup size is selected, retrieve cup size information
    $cup_size_name = null;
    $cup_size_price = null;
    if ($cup_size_id !== null) {
        $cup_size_query = "SELECT size_name, price FROM cup_sizes WHERE id = ?";
        $stmt = $conn->prepare($cup_size_query);
        $stmt->bind_param("i", $cup_size_id);
        $stmt->execute();
        $cup_size_result = $stmt->get_result();
        $cup_size_row = $cup_size_result->fetch_assoc();
        $cup_size_name = $cup_size_row['size_name'];
        $cup_size_price = $cup_size_row['price'];
    }

    // Retrieve product information
    $product_query = "SELECT * FROM products WHERE id = ?";
    $stmt = $conn->prepare($product_query);
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $product_result = $stmt->get_result();
    $product = $product_result->fetch_assoc();

    // Retrieve sugar level information
    $sugar_level_name = null;
    if ($sugar_level_id !== null) {
        $sugar_level_query = "SELECT level_name FROM sugar_level WHERE level_id = ?";
        $stmt = $conn->prepare($sugar_level_query);
        $stmt->bind_param("i", $sugar_level_id);
        $stmt->execute();
        $sugar_level_result = $stmt->get_result();
        $sugar_level_row = $sugar_level_result->fetch_assoc();
        $sugar_level_name = $sugar_level_row['level_name'];
    }

    // Create an array to store the item details
    $item = [
        'product_id' => $product_id,
        'product_name' => $product['name'],
        'quantity' => $quantity,
        'cup_size_id' => $cup_size_id,
        'cup_size_name' => $cup_size_name,
        'cup_size_price' => $cup_size_price, // Adding cup size price
        'addon_id' => $addon_id,
        'addon_name' => $addon_name, // Assign addon name
        'addon_price' => $addon ? $addon['price'] : null,
        'addon_quantity' => $addon_quantity,
        'product_image' => $product['image'], // Add product image data
        'addon_image' => $addon_image, // Add addon image data
        'sugar_level_name' => $sugar_level_name // Add sugar level name
    ];

    // Generate unique ID for cart item
    $unique_id = uniqid(); 
    // Store the item in the session cart with unique ID
    $_SESSION['cart'][$unique_id] = $item;

    // Redirect back to index.php or wherever you need to go
    header("Location: index.php");
    exit();
}
?>
