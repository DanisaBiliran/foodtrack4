import 'package:flutter/material.dart';
import 'package:foodtrack/categories/fruits-vegetables.dart';
import 'package:intl/intl.dart';

class DetailsFruits extends StatefulWidget {
  const DetailsFruits({super.key});

  @override
  DetailsFruitsState createState() => DetailsFruitsState();
}

class DetailsFruitsState extends State<DetailsFruits> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  int? _number;
  int? _numberEquivalent; // New variable for the second text field
  bool _showButtons = false; // State variable to control button visibility
  bool _isEditable = false; // State variable to control field editability

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1598A5),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Details',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
        ),
        leading: _showButtons
            ? Container() // Hide the edit icon when buttons are visible
            : IconButton(
                onPressed: () {
                  setState(() {
                    _showButtons = true; // Show buttons
                    _isEditable = true; // Make fields editable
                  });
                },
                icon: const Icon(Icons.edit_square),
                color: Colors.white,
              ),
        actions: [
          if (!_showButtons) // Hide the close icon when buttons are visible
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FruitsVegetables(),
                    ),
                  );
                },
                icon: const Icon(Icons.highlight_remove),
                color: Colors.white,
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Enter EITHER Expiration Date or Shelf-Life, but NOT BOTH',
                    style: TextStyle(color: Color.fromARGB(255, 192, 191, 191)),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Date Section
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                // Expiration Date Label
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Expiration Date',
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                // DATE Picker
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextField(
                      readOnly: !_isEditable,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'yyyy-mm-dd',
                        hintText: _selectedDate == null
                            ? 'No date chosen!'
                            : DateFormat('yyyy-MM-dd')
                                .format(_selectedDate!),
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      onTap: () {
                        if (_isEditable) {
                          _selectDate(context);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //SHELF-LIFE SECTION
                Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Shelf-Life',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: !_isEditable,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText:
                                "time before food goes bad (days:hours:minutes)",
                            hintMaxLines: 2,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                          onSaved: (value) => _number = int.tryParse(value!),
                        ),
                      ]),
                    ),
                    // Equal Icon
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: const Text(
                        "=",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 80.0,
                        ),
                      ),
                    ),
                    //TIMER
                    Expanded(
                      child: Column(children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Timer',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        TextFormField(
                          readOnly: true, // This field remains read-only
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 207, 193, 193),
                          ),
                          controller: TextEditingController(
                            text: _numberEquivalent?.toString() ??
                                '', // Display derived data
                          ),
                          validator: (value) {
                            // No validation needed for read-only field
                            return null;
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                //ADDITIONAL INFORMATION
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Additional Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //LOCATION STORED
                Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Location Stored',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: TextField(
                        readOnly: !_isEditable,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "(optional)",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //NOTES
                Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Notes',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: TextField(
                        readOnly: !_isEditable,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "(optional)\n\n\n\n\n\n",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                // Conditionally render the buttons based on _showButtons state
                                if (_showButtons)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0, // Adjust the top value as needed
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // X BUTTON
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showButtons = false; // Hide buttons and show icons
                                _isEditable = false; // Make fields read-only
                              });
                              print("Cancelled");
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFD9534F),
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                          // Spacer
                          const SizedBox(
                            width: 100.0, // Adjust the width value as needed to control spacing
                          ),
                          // CHECK BUTTON
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showButtons = false; // Hide buttons and show icons
                                _isEditable = false; // Make fields read-only
                              });
                              print("Check icon tapped");
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF4CAF50),
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
