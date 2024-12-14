import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';

class terms_conditions extends StatelessWidget {
  const terms_conditions({super.key});

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
             child: const Icon(Icons.receipt_long, color: Color.fromARGB(255, 23, 161, 173)), 
           ),
        ],
      ),

      drawer: const MenuDrawer(), //these will be the menu icon on the left side of the appbar
      
      body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 18), //space between 'terms and con' & white box
            const Center(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(
                    20.0), //space between edge of text & white box
                color: const Color(0xffffffff),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    """
_Last updated: December 1_

1. Introduction
Welcome to FoodTrack! These terms and conditions govern your use of our mobile application, which is designed to help you track the expiration and shelf-life of your food items. By accessing and using FoodTrack, you agree to comply with these terms. If you do not agree with these terms, please do not use our app.

2. User Responsibilities
- Accuracy of Information:** You are responsible for ensuring the accuracy of the information you enter into FoodTrack. This includes expiration dates, storage locations, and any additional notes.
- Prohibited Activities:** You agree not to misuse the app, including but not limited to, attempting to gain unauthorized access to the app, transmitting harmful or malicious content, or engaging in any activity that may disrupt the app’s functionality.

3. Intellectual Property
- Ownership:** All content, trademarks, and data provided through FoodTrack are owned by the app creators. You may not use our intellectual property without permission.
- Restrictions:** You may not reproduce, distribute, or create derivative works from any content provided through FoodTrack without prior written consent.

4. Privacy and Data Protection
- Data Collection:** FoodTrack operates offline, and any data you input is stored locally on your device. We do not collect or store any personal information on our servers.
- User Consent:** You agree that any data you provide to FoodTrack is accurate and that you have the necessary consent to share it.
- Data Security:** While FoodTrack does not transmit data over the internet, you are responsible for securing your device and ensuring the safety of your data.

5. Limitation of Liability
- Disclaimer of Warranties:** FoodTrack is provided "as is" without any warranties of any kind. We do not guarantee that the app will be error-free or that it will meet your specific needs.
- Limitation of Liability:** To the maximum extent permitted by law, the creators of FoodTrack will not be liable for any indirect, incidental, special, or consequential damages arising from your use of FoodTrack.
- Indemnification:** You agree to indemnify and hold the creators of FoodTrack harmless from any claims arising out of your use of FoodTrack or your breach of these terms.

6. Termination
- Usage Termination:** We reserve the right to terminate your access to FoodTrack if you violate these terms or engage in any conduct that we deem inappropriate.
- Effects of Termination:** Upon termination, your access to FoodTrack will be revoked, and any data associated with your use of the app may be deleted.

7. Governing Law
These terms and conditions are governed by the laws of [Your Country/State], without regard to its conflict of law principles.

8. Amendments
- Changes to Terms:** We may amend these terms at any time. Any changes will be effective immediately upon posting the updated terms within the app.
- Notification:** We will notify you of any significant changes to these terms through the app or by other means.

9. Contact Information
If you have any questions or concerns about these terms and conditions, please contact us at +65 976 502 5765.
                    """,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );
  }
}
