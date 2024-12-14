import 'package:flutter/material.dart';
import 'package:foodtrack/menu.dart';
import 'package:isar/isar.dart';
import 'package:foodtrack/database/food.dart'; // Ensure this imports your Food model

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  final isar = await Isar.open([FoodSchema], directory: ''); // Open Isar with your schemas

  runApp(MyApp(isar: isar)); // Pass the Isar instance to MyApp
}

class MyApp extends StatelessWidget {
  final Isar isar; // Add Isar instance

  const MyApp({super.key, required this.isar}); // Update constructor to accept Isar

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: menu(isar: isar), // Pass Isar instance to Menu
    );
  }
}
