import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cartprovider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;
    final total = Provider.of<CartProvider>(context).calculateTotal();

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Image.network(cartItems[index]['image']),
                            title: Text(cartItems[index]['name']),
                            subtitle: Text(cartItems[index]['price']),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle,
                                  color: Colors.red),
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeFromCart(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Total: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // You can add your checkout functionality here
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Purchase Complete"),
                          content: const Text("Thank you for your purchase!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .cartItems
                                    .clear(); // Clear the cart
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Buy Now"),
                  ),
                ],
              ),
            ),
    );
  }
}
