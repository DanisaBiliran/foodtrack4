import 'package:flutter/material.dart';
import 'package:foodtrack/database/food.dart';
import 'package:isar/isar.dart';

class DetailsSweets extends StatefulWidget {
  final int foodId;
  final Isar isar; // Add Isar instance

  const DetailsSweets({super.key, required this.foodId, required this.isar}); // Accept Isar instance

  @override
  DetailsSweetsState createState() => DetailsSweetsState();
}

class DetailsSweetsState extends State<DetailsSweets> {
  final _formKey = GlobalKey<FormState>();
  final bool _isEditable = false;
  Food? food;

  @override
  void initState() {
    super.initState();
    loadFoodDetails();
  }

  Future<void> loadFoodDetails() async {
    final fetchedFood = await widget.isar.foods.get(widget.foodId); // Use widget.isar
    setState(() {
      food = fetchedFood;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (food == null) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1598A5),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Details',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
          child: Column(children: [
            const Center(
              child: Text(
                'Food Details',
                style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text('Name: ${food!.name}', style: const TextStyle(color: Colors.white)),
            Text('Category: ${food!.category}', style: const TextStyle(color: Colors.white)),
            Text('Description: ${food!.description}', style: const TextStyle(color: Colors.white)),
            Text('Price: \$${food!.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
          ]),
        ),
      ),
    );
  }
}
