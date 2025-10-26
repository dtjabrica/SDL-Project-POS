<?php
session_start();
include 'pos_db.php'; // Include your database connection file

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_SESSION['cart'])) {
        // Calculate total order price
        $totalOrderPrice = 0;
        foreach ($_SESSION['cart'] as $item) {
            $totalOrderPrice += ($item['product_price'] * $item['product_quantity']) + ($item['addon_price'] * $item['addon_quantity']);
        }

        // Create a new order
        $stmt = $conn->prepare("INSERT INTO orders (order_date, total_price) VALUES (CURRENT_TIMESTAMP, ?)");
        $stmt->bind_param("d", $totalOrderPrice);
        $stmt->execute();
        $orderId = $stmt->insert_id;

        // Insert items into order_items table
        foreach ($_SESSION['cart'] as $item) {
            $productName = $item['product_name'];
            $productPrice = $item['product_price'];
            $productQuantity = $item['product_quantity'];
            $addonName = $item['addon_name'];
            $addonPrice = $item['addon_price'];
            $addonQuantity = $item['addon_quantity'];
            $totalItemPrice = ($productPrice * $productQuantity) + ($addonPrice * $addonQuantity);

            $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_name, product_price, product_quantity, addon_name, addon_price, addon_quantity, total_item_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("isdissdi", $orderId, $productName, $productPrice, $productQuantity, $addonName, $addonPrice, $addonQuantity, $totalItemPrice);
            $stmt->execute();
        }

        // Clear the cart after processing the sale
        unset($_SESSION['cart']);

        // Redirect back to index.php or display a success message
        header("Location: index.php");
        exit();
    } else {
        // Handle case where the cart is empty
        // Redirect back to index.php or display an error message
        header("Location: index.php");
        exit();
    }
}
?>
