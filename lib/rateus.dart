import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';

class rateus extends StatelessWidget {
  const rateus({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E6B73),
        iconTheme: const IconThemeData(color: Colors.white),
        
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18.0),
            child: const Icon(Icons.star, color: Color.fromARGB(255, 23, 161, 173)),
          ),
        ],
      ),

      drawer: const MenuDrawer(), //these will be the menu icon on the left side of the appbar
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            const Center(
              child: Text(
                "Rate Us",
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                color: const Color(0xffffffff),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Thank you for using foodTRACK! If you're enjoying the app, please take a moment to rate us on the Google Play Store. Your feedback helps us improve the app and provide the best possible experience.\n\nYour rating and review mean a lot to us and the app's development. Thank you for your support!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );
  }
}
