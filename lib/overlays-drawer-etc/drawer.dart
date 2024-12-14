import 'package:flutter/material.dart';
import 'package:foodtrack/aboutus.dart';
import 'package:foodtrack/helpandsupport.dart';
import 'package:foodtrack/notif.dart';
import 'package:foodtrack/rateus.dart';
import 'package:foodtrack/terms_conditions.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.menu,
              color: Color(0xFF0E6B73),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.category, color: Color(0xFF0E6B73)),
            title: const Text("Category",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const menu(),
              //   ),
              // );
            },
          ),

          //NOTIFICATIONS
          ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF0E6B73)),
            title: const Text("Notifications",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const Notif()),
                ),
              );
            },
          ),

          //TERMS AND CONDITIONS
          ListTile(
            leading: const Icon(Icons.receipt_long, color: Color(0xFF0E6B73)),
            title: const Text("Terms and Conditions",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const terms_conditions()),
                ),
              );
            },
          ),

          //HELP AND SUPPORT
          ListTile(
            leading: const Icon(Icons.phone, color: Color(0xFF0E6B73)),
            title: const Text("Help & Support",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const helpandsupport()),
                ),
              );
            },
          ),

          //ABOUT US
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF0E6B73)),
            title: const Text("About Us",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const about_us()),
                ),
              );
            },
          ),

          //RATE US
          ListTile(
            leading: const Icon(Icons.star, color: Color(0xFF0E6B73)),
            title: const Text("Rate Us",
                style: TextStyle(color: Color(0xFF0E6B73))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (const rateus()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
