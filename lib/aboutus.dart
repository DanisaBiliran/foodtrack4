import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';

class about_us extends StatelessWidget {
  const about_us({super.key});

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
            child: const Icon(Icons.info, color: Color.fromARGB(255, 23, 161, 173)),
          ),
        ],
      ),

      drawer: const MenuDrawer(), //this will be the menu icon on the left side of the appbar
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            const Center(
              child: Text(
                "About Us",
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            //SizedBox(height: 5),
            Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "    Welcome to FoodTrack, your trusted companion in food management and food waste reduction. Built in 2024, we are committed to helping you organize and optimize your kitchen with ease.\n\n",
                        ),
                        TextSpan(
                          text: "Our Mission\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "At FoodTrack, our mission is to empower you to take control of your food inventory, ensuring that nothing goes to waste. We're striving to promote sustainability and help you make wiser food choices.\n\n",
                        ),
                        TextSpan(
                          text: "Our Vision\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "We aim to create a future where every household minimizes food waste, contributing to a healthier planet. Our vision is to lead a global shift toward smarter, more sustainable food management practices.\n\n",
                        ),
                        TextSpan(
                          text: "Key Features\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "List Management: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "Easily add or remove food items, note their storage locations as well as other details, and set expiration dates or shelf-life with timely notifications.\n",
                        ),
                        TextSpan(
                          text: "Categorization: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "Access your food items quickly with them being organized into categories like grains, fruits, meats, and sweets.\n",
                        ),
                        TextSpan(
                          text: "Search Functionality: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "Instantly find any food item in your inventory.\n",
                        ),
                        TextSpan(
                          text: "Notifications: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "Get notified when your food items are nearing their expiration dates, helping you use them before they go to waste.\n\n",
                        ),
                        TextSpan(
                          text: "    Join us at FoodTrack and take the initial step towards more effective and sustainable food management!",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
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
