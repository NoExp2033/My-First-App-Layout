import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: PlaceReviewScreen(),
    );
  }
}

class PlaceReviewScreen extends StatefulWidget {
  @override
  _PlaceReviewScreenState createState() => _PlaceReviewScreenState();
}

class _PlaceReviewScreenState extends State<PlaceReviewScreen> {
  double rating = 0.0;
  String randomDescription = generateRandomDescription();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: StylizedAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Place Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              randomDescription,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= rating ? Icons.star : Icons.star_border,
                      size: 40,
                    ),
                    color: Colors.amber,
                    onPressed: () {
                      setState(() {
                        rating = i.toDouble();
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Icon Descriptions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconDescription(icon: Icons.restaurant, text: 'Great Food'),
                IconDescription(icon: Icons.hotel, text: 'Comfortable Stay'),
                IconDescription(
                    icon: Icons.shopping_cart, text: 'Shopping Paradise'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String generateRandomDescription() {
    List<String> descriptions = [
      'Explore the breathtaking landscapes and scenic views at our wonderful destination.',
      'Discover the rich history and culture that our place has to offer to every visitor.',
      'Enjoy the vibrant nightlife and entertainment options that make our place special.',
      'Escape to a peaceful retreat surrounded by nature and tranquility.',
    ];
    final random = Random();
    return descriptions[random.nextInt(descriptions.length)];
  }
}

class IconDescription extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconDescription({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 8),
        Text(text, textAlign: TextAlign.center),
      ],
    );
  }
}

class StylizedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0, // Removes the shadow
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: Text(
        'My First App Layout',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Colors.white,
          fontFamily: 'Roboto', // You can customize the font family
        ),
      ),
    );
  }
}
