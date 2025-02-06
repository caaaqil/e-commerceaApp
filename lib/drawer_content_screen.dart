import 'package:flutter/material.dart';
import 'detailsPage.dart';

class DrawerContentScreen extends StatelessWidget {
  const DrawerContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.orange),
          child:
              Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        
        _buildListTile(
          context,
          'Vision',
          Icons.visibility,
          'Vision: Haldoor Company aspires to be a global leader in the e-commerce electronics sector, redefining the online shopping experience through innovative technology and unparalleled customer service. We aim to empower consumers with easy access to high-quality electronic products, fostering a future where technology enhances everyday life.',
        ),
        _buildListTile(
          context,
          'Mission',
          Icons.flag,
          'Mission: Haldoor Company is committed to providing customers with the best online shopping experience, offering a wide selection of high-quality electronic products at competitive prices. We strive to deliver exceptional customer service, ensuring that every purchase meets or exceeds our customers’ expectations. Our mission is to make online shopping easy, convenient, and enjoyable for everyone.',
        ),
        _buildListTile(
          context,
          'About',
          Icons.info,
          'About: Haldoor Company is a leading e-commerce platform that specializes in electronic products. Our company was founded in 2010 with the goal of providing customers with a convenient and secure online shopping experience. We offer a wide range of electronic products, including smartphones, laptops, tablets, and accessories, from top brands such as Apple, Samsung, and Sony. Our mission is to make online shopping easy, convenient, and enjoyable for everyone.',
        ),
      ],
    );
  }

  ListTile _buildListTile(
      BuildContext context, String title, IconData icon, String details) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(title: title, details: details),
          ),
        );
      },
    );
  }
}
