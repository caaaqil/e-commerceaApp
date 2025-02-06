// import 'package:flutter/material.dart';  
// import 'package:firebase_auth/firebase_auth.dart';  
// import 'product_screen.dart';  
// import 'firebase-service.dart';  

// import 'package:flutter/material.dart';
// import 'product_screen.dart';

// class PurchaseProductScreen extends StatelessWidget {
//   final Product product;

//   const PurchaseProductScreen({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Purchase ${product.name}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('You are about to purchase ${product.name}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 16),
//             Text('Price: \$${product.price}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle purchase logic here
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Purchased ${product.name} successfully!')),
//                 );
//               },
//               child: Text('Confirm Purchase'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
