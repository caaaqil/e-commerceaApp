import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cartprovider.dart';

import 'cart_screen.dart';

class ProductScreen extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Expanded(child: Image.network(image, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(price,
                    style: const TextStyle(fontSize: 20, color: Colors.orange)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart using the provider
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart({
                      'image': image,
                      'name': name,
                      'price': price,
                    });

                    // Show a confirmation snack bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$name added to cart!')),
                    );

                    // Navigate to the CartScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen()),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
