import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddGrains {
  OverlayEntry? overlayEntry;
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  void show(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Darkened background
          Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent black
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Material(
              color: const Color(0xFF1598A5),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ENTER FOOD NAME TEXTFIELD
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter food name",
                          hintStyle:
                              TextStyle(color: const Color(0xFF0E6B73).withOpacity(0.5)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // SPACE

                    // UPLOAD A PICTURE TEXT
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload a picture:",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10), // SPACE

                    // Placeholder as a button to select an image
                    GestureDetector(
                      onTap: () async {
                        await _pickImage(); // Call image picker when tapped
                      },
                      child: selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(File(selectedImage!.path), height: 200, width: double.infinity, fit: BoxFit.cover),
                            )
                          : Container(
                              height: 200, // Fixed height for the placeholder
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 64, 63, 63), 
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Center(
                                child: Text(
                                  "Tap to select an image",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                    ),

                    const SizedBox(height: 10), // SPACE

                    // 2 buttons at the bottom
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // X BUTTON
                          GestureDetector(
                            onTap: () {
                              print("Cancelled");
                              removeOverlay(); // REMOVE WHEN TAPPED
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFFD9534F),
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ),

                          // CHECK BUTTON
                          GestureDetector(
                            onTap: () {
                              print("Check icon tapped");
                              removeOverlay(); // REMOVE overlay WHEN TAPPED
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF4CAF50),
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert the overlay entry into the Overlay
    Overlay.of(context).insert(overlayEntry!);
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = image; // Store the selected image
        overlayEntry?.markNeedsBuild(); // Refresh overlay to update UI
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null; // Reset overlayEntry after removal
  }
}