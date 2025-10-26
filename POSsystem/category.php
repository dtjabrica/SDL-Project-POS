<?php
include 'pos_db.php';

if(isset($_GET['category_id'])){
    $category_id = $_GET['category_id'];
    $category_query = "SELECT * FROM categories WHERE category_id = $category_id";
    $result = $conn->query($category_query);
    $category = $result->fetch_assoc();
    echo "<h1>{$category['category_name']} Products</h1>";
    echo "<ul>";
    $product_query = "SELECT * FROM products WHERE category_id = $category_id";
    $product_result = $conn->query($product_query);
    while($product = $product_result->fetch_assoc()){
        echo "<li>{$product['name']} - \${$product['price']}</li>";
    }
    echo "</ul>";
}
?>