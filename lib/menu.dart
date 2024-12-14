import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';
import 'package:foodtrack/categories/grains-cereals.dart';
import 'package:foodtrack/categories/fruits-vegetables.dart';
import 'package:foodtrack/categories/meats-dairy.dart';
import 'package:foodtrack/categories/sweets.dart';

import 'package:isar/isar.dart';

class menu extends StatelessWidget {
  final Isar isar; // Add Isar instance

  const menu({super.key, required this.isar}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E6B73),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to exit the app?'),
                    actions: [
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          // Add your exit logic here
                        },
                      ),
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: const MenuDrawer(), // Menu drawer on the left side of the app bar
      body: SingleChildScrollView( // Whole body is scrollable
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                // Space between app bar and food image
                const SizedBox(height: 60),

                // Food image
                Container(
                  margin: const EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
                  child:
                      Image.asset('image/foodTRACK.png', fit : BoxFit.contain),
                ),

                // Space
                const SizedBox(height: 60),

                // The grid of categories
                GridView.count(
                  shrinkWrap: true, // Take up only as much space as needed
                  physics: const NeverScrollableScrollPhysics(), // Unscrollable
                  crossAxisCount: 2, // Number of columns
                  padding: const EdgeInsets.all(2.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: [
                    // Grain category
                    GestureDetector(
                      child:
                          Image.asset('image/grains.png', fit : BoxFit.contain),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => const GrainsCereals()),
                        );
                      },
                    ),

                    // Fruit category
                    GestureDetector(
                      child:
                          Image.asset('image/fruits.png', fit : BoxFit.contain),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => const FruitsVegetables()),
                        );
                      },
                    ),

                    // Meat category
                    GestureDetector(
                      child:
                          Image.asset('image/meats.png', fit : BoxFit.contain),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => const MeatsDairy()),
                        );
                      },
                    ),

                    // Sweets category
                    GestureDetector(
                      child:
                          Image.asset('image/sweets.png', fit : BoxFit.contain),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context) => Sweets(isar: isar)), // Pass Isar instance here
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
