import 'package:app/common/color_extension.dart';
import 'package:flutter/material.dart';
import '../../model/cart.dart';

class ProductDetailsView extends StatefulWidget {
  final Map item;

  const ProductDetailsView({super.key, required this.item});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Information"),
        backgroundColor: TColor.button,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.item['icon'],
                height: 150,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Price: ${widget.item['price']}",
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text("$quantity", style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: TColor.button,
                  ),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Cart.items.add({
                  'name': widget.item['name'],
                  'icon': widget.item['icon'],
                  'qty': quantity,
                  'price': widget.item['price'],
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "${widget.item['name']} added to cart (Qty: $quantity)"),
                  ),
                );

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.1,
                backgroundColor:
                    TColor.button, // Adjust this to your desired color
                minimumSize:
                    Size(double.infinity, 60), // Full width and specific height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: Text(
                "Add to Cart",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
