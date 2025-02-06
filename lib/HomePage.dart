import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'FavoritesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'detailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> products = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi8MYLHSYCpRD4itfLwsDoIQZVUX5P1u79dg&s',
      'name': 'Apple Watch',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSapbu_VKHzykwQARWTKRFV7Y3pSYN9X-LSvQ&s',
      'name': 'charger iphone',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO5UXi94YI92EXg520HGY7d8x0w6RRM0I3pw&s',
      'name': 'ihone',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX0f_FUk1H46nRVicG33bJZSRqA51Fb8yDWQ&s',
      'name': 'laptop stand',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzTGN0smAoC_lAQM_-MVPoY1f-K-vKST5Uxw&s',
      'name': 'labtop bag',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrZGRVyL57xEFAo7Iw6YV3CEuVf78ZwcIGCQ&s',
      'name': 'airpods',
      'price': '\$429.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIo84SV4-Fb-O7ZJr_gYO-q28GoxOCiydQ0g&s',
      'name': 'sumsong ultra 24',
      'price': '\$999.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMzTx4EXGAsLKYXCkQwrf8pMyUXGWPArDXfQ&s',
      'name': 'MacBook Pro',
      'price': '\$1299.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpAHg8d4k-Jdjl-9HAd5demgB7OO2fQmTZA&s',
      'name': 'Headphones',
      'price': '\$199.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSObsvZ26nPyS9jAIfB5OPTxb2csOeb7DekFA&s',
      'name': 'Bluetooth Speaker',
      'price': '\$149.00',
      'isFavorite': false,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYyjJfyF3Pea0irDOEsYus6qHcHbG5fjCObQ&s',
      'name': 'iPad Air',
      'price': '\$599.00',
      'isFavorite': false,
    },
  ];

  // Add more products as needed

  List<Map<String, dynamic>> favorites = []; // List for favorite products

  void toggleFavorite(int index) {
    setState(() {
      products[index]['isFavorite'] = !products[index]['isFavorite'];
      if (products[index]['isFavorite']) {
        favorites.add(products[index]);
      } else {
        favorites
            .removeWhere((item) => item['name'] == products[index]['name']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favorites: favorites),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Drawer(
          backgroundColor: Colors.lightBlue,
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  'Vision',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.visibility, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Vision'),
                        content: const Text(
                          'Vision: Haldoor Company aspires to be a global leader in the e-commerce electronics sector, '
                          'redefining the online shopping experience through innovative technology and unparalleled customer service. '
                          'We aim to empower consumers with easy access to high-quality electronic products, fostering a future where '
                          'technology enhances everyday life.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Mission',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.flag, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Mission',
                        ),
                        content: const Text(
                            'Mission: Haldoor Company is to providing customers with the best online shopping experience, '
                            'offering a wide selection of high-quality electronic products at competitive prices. We strive to deliver '
                            'exceptional customer service, ensuring that every purchase meets or exceeds our customers’ expectations. '
                            'Our mission also includes fostering sustainable business practices, leveraging cutting-edge technology to enhance '
                            'efficiency, and building a trusted brand that prioritizes customer satisfaction, innovation, and excellence in every aspect.'),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Core Values',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.star, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Core Values'),
                        content: const Text(
                          'Integrity, Innovation, Excellence, Teamwork, and Responsibility.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.info, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('About'),
                        content: const Text(
                          'About: Haldoor Company is a leading e-commerce platform that specializes in electronic products. '
                          'Our company was founded in 2010 with the goal of providing customers with a convenient and secure '
                          'online shopping experience. We offer a wide range of electronic products, including smartphones, '
                          'laptops, tablets, and accessories, from top brands such as Apple, Samsung, and Sony.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'News',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.newspaper, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('News'),
                        content: const Text(
                          'The e-commerce electronics project is rapidly growing, with the Indian electronics market expected to reach USD 500 billion by 2030. This will require an expansion in production and the creation of many jobs. However, mobile phone manufacturers have requested a reduction in import duties to lower costs and enhance the parts sector. Additionally, there has been a significant increase in the export of electronic devices due to economic shifts in the market. Consumers are also increasingly moving towards online shopping, indicating further changes in how people purchase electronic gadgets.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.newspaper, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Contact Us'),
                        content: const Text(
                            'Haldoor Electronics is a leading e-commerce platform specializing in high-quality electronic products. We are committed to enhancing the shopping experience by leveraging innovation, delivering excellent customer service, and offering a diverse selection of electronics. Whether you have inquiries about our products or need assistance, our team is readily available to help you make informed decisions and ensure your satisfaction'),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.update, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Update'),
                        content: const Text(
                          'Vision: Haldoor Company aspires to be a global leader in the e-commerce electronics sector, '
                          'redefining the online shopping experience through innovative technology and unparalleled customer service. '
                          'We aim to empower consumers with easy access to high-quality electronic products, fostering a future where '
                          'technology enhances everyday life.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Contact',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.newspaper, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Contact Us'),
                        content: const Text(
                            'Haldoor Electronics is a leading e-commerce platform specializing in high-quality electronic products. We are committed to enhancing the shopping experience by leveraging innovation, delivering excellent customer service, and offering a diverse selection of electronics. Whether you have inquiries about our products or need assistance, our team is readily available to help you make informed decisions and ensure your satisfaction'),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Contact Information:',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.newspaper, color: Colors.white),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Address'),
                        content: const Text('Haldoor Electronics'
                            '123 Tech Lane'
                            'Silicon Valley, CA 94043'
                            'USA'
                            'Phone:'
                            '+1 (800) 555-0199'
                            'Email:'
                            'support@haldoorelectronics.com'
                            'Business Hours:'
                            'Monday to Friday: 9 AM - 6 PM (PST)'
                            'Saturday: 10 AM - 4 PM (PST)'
                            'Sunday: Closed'),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner for discount
            Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 185, 234),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  '50% OFF on all products! Use code: HALDOOR50',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between banner and categories

            // Top Categories Title

            // Icons to represent categories
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.devices, size: 40, color: Colors.blue),
                    Text('Electronics'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.phone_android,
                        size: 40, color: Colors.lightGreen),
                    Text('Mobiles'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.laptop, size: 40, color: Colors.orange),
                    Text('Laptops'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.local_offer, size: 40, color: Colors.black),
                    Text('Offers'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20), // Space between icons and GridView

            // Products GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                            image: products[index]['image'],
                            name: products[index]['name'],
                            price: products[index]['price'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Image.network(
                                  products[index]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(
                                    products[index]['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        const Color.fromARGB(255, 212, 72, 44),
                                  ),
                                  onPressed: () {
                                    toggleFavorite(index);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              products[index]['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(products[index]['price']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
