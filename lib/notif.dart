import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';

class Notif extends StatelessWidget {
  const Notif({super.key});

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
            child: const Icon(Icons.notifications, color: Color.fromARGB(255, 23, 161, 173)), 
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
                "Notifications",
                style: TextStyle(
                  color: Colors.white, // Updated text color to white
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                color: Colors.white,
                height: 300.0, // You can adjust the height
                width: double.infinity, // Makes it take the full width
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
