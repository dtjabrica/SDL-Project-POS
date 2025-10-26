<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['remove_item'])) {
        $itemIdToRemove = $_POST['remove_item'];

        removeFromCart('cart', $itemIdToRemove);
    }
}

function removeFromCart($cartType, $itemIdToRemove) {
    if (isset($_SESSION[$cartType])) {
        foreach ($_SESSION[$cartType] as $key => $item) {
            if ($key == $itemIdToRemove) {
                unset($_SESSION[$cartType][$key]);
                break;
            }
        }
    }
    // Redirect back to the index.php page
    header("Location: index.php");
    exit();
}
?>
