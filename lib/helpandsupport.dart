import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class helpandsupport extends StatefulWidget {
  const helpandsupport({super.key});

  @override
  _HelpAndSupportState createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<helpandsupport> {
  bool _isMessageVisible = false;

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    await launchUrl(launchUri);
  }

  void _copyToClipboard(BuildContext context, String text) async {
    try {
      await Clipboard.setData(ClipboardData(text: text));
      // alert message after copying
      setState(() {
        _isMessageVisible = true;
      });

      // Hide the message after 2 seconds
      Timer(const Duration(seconds: 2), () {
        setState(() {
          _isMessageVisible = false;
        });
      });
    } catch (e) {
      // Handle any errors here if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to copy to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

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
            child: const Icon(Icons.phone, color: Color.fromARGB(255, 23, 161, 173)),
          ),
        ],
      ),

      drawer: const MenuDrawer(), // These will be the menu icon on the left side of the appbar
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18), // Space between appbar and 'Help and Support'
            const Center(
              child: Text(
                "Help and Support",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Call at this Number.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // White box with number & call icon button
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          padding:
                              const EdgeInsets.all(10), // Padding for better appearance
                          child: const Text("+63 976 502 5765",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.call),
                          iconSize: 50,
                          color: Colors.black,
                          onPressed: () {
                            _makePhoneCall('+639765025765');
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20), // Space between call & email
                    const Text(
                      "Send a Message at this e-mail.",
                      style:
                          TextStyle(color: Colors.black, fontSize: 20),
                    ),

                    // Wrap Row in Builder for correct context
                    Builder(
                      builder:(context) => Row(
                        children: [
                          Container(
                            color: Colors.white,
                            padding:
                                const EdgeInsets.all(10), // Padding for better appearance
                            child:
                                const Text("FoodTrack@gmail.com",
                                    style:
                                        TextStyle(color:
                                            Colors.black,
                                            fontSize:
                                                20)),
                          ),
                          const SizedBox(width:
                              10), // Space between email white box & copy button
                          IconButton(
                            icon:
                                const Icon(Icons.copy),
                            iconSize:
                                50,
                            color:
                                Colors.black,
                            onPressed:
                                () {
                              _copyToClipboard(context, "FoodTrack@gmail.com");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Centered message container
            if (_isMessageVisible)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Copied to clipboard',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );
  }
}