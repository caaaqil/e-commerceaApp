// import 'package:cloud_firestore/cloud_firestore.dart';  
// import 'product_screen.dart';  

// class FirebaseService {  
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;  

//   // Kaydinta alaabta iibsiga  
//   Future<void> savePurchase(String userId, ProductScreen product) async {  
//     await _firestore.collection('purchases').add({  
//       'userId': userId,  
       
//       'productName': product.name,  
//       'productPrice': product.price,  
//       'productImage': product.image,  
//       'purchaseDate': Timestamp.now(),  
//     });  
//   }  
// }

