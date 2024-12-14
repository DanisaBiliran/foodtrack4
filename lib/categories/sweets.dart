import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/addsweet.dart';
import 'package:foodtrack/menu.dart';
import 'package:foodtrack/overlays-drawer-etc/details-sweets.dart';
import 'package:foodtrack/database/food.dart';
import 'package:isar/isar.dart';

class Sweets extends StatelessWidget {
  final Isar isar;

  const Sweets({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    final AddSweet addSweet = AddSweet(isar); // Pass Isar instance

    return Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E6B73),
        title: SizedBox(
          height: 30.0,
          width: MediaQuery.of(context).size.width * 0.64,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search...',
              filled: true,
              fillColor: Color(0xFF4DB6B0),
              hintStyle: TextStyle(color: Color.fromARGB(255, 131, 129, 129), fontSize: 18.0),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              // Handle search logic here
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => menu(isar:isar)));
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Food>>(
        future: isar.foods.filter().categoryEqualTo('Sweets').findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final foods = snapshot.data ?? [];
          return ListView.separated(
            itemCount: foods.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(foods[index].name),
                tileColor: Colors.white,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsSweets(foodId: foods[index].id, isar: isar))); // Pass Isar instance if needed
                },
                leading: const Icon(Icons.cake), // Example icon for sweets
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await isar.writeTxn((isar) async {
                      await isar.foods.delete(foods[index].id);
                    } as Future Function());
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addSweet.show(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
