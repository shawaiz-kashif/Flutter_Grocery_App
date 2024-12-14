import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../model/cart.dart';

class CartScreen extends StatelessWidget {
  // Function to save cart items to Firestore
  Future<void> saveCartToFirestore() async {
    // Reference to the 'myCart' collection in Firestore
    CollectionReference myCart =
        FirebaseFirestore.instance.collection('myCart');

    // Iterate through the cart items and add them to Firestore
    for (var item in Cart.items) {
      // Ensure the item details are correctly converted to a Map
      Map<String, dynamic> itemData = {
        'name': item['name'],
        'price': item['price'],
        'qty': item['qty'],
        'icon': item['icon'],
      };

      // Add each item as a document to Firestore
      try {
        await myCart.add(itemData);
      } catch (e) {
        print("Error saving item: $e");
      }
    }

    print("Cart items saved to Firestore!");
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

    // Calculate total amount from cart items
    for (var item in Cart.items) {
      double price = double.tryParse(item['price'].toString()) ?? 0;
      int qty = item['qty'] ?? 0;
      totalAmount += price * qty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: TColor.button,
      ),
      body: Cart.items.isEmpty
          ? const Center(
              child: Text("Your cart is empty."),
            )
          : Column(
              children: [
                // List of items in cart
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.items.length,
                    itemBuilder: (context, index) {
                      final item = Cart.items[index];
                      return ListTile(
                        leading: Image.asset(
                          item['icon'],
                          width: 50,
                        ),
                        title: Text(item['name']),
                        subtitle: Text("Qty: ${item['qty']}"),
                        trailing: Text("${item['price']}"),
                      );
                    },
                  ),
                ),
                // Total amount section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$${totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: TColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Proceed to Checkout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Save cart items to Firestore
                      await saveCartToFirestore();

                      // Navigate to Checkout screen (You can adjust this as needed)
                      Navigator.pushNamed(context, '/checkout');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.1,
                      backgroundColor:
                          Colors.green, // Adjust this to your desired color
                      minimumSize: Size(double.infinity,
                          60), // Full width and specific height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                    child: const Text(
                      "Proceed to Checkout",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
    );
  }
}
