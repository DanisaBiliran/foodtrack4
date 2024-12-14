import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../database/food.dart'; // Import your food model
import 'package:isar/isar.dart';

class AddSweet {
  OverlayEntry? overlayEntry;
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;
  final Isar isar;

  // Controllers for user input
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  AddSweet(this.isar); // Accept Isar instance

  void show(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder:(context) => Stack(
        children:[
          Container(color: Colors.black.withOpacity(0.5)),
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
                  children:[
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(hintText: "Enter food name", filled:true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.black),)),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Upload a picture:", style: TextStyle(color: Colors.white)),
                    ),
                    GestureDetector(
                      onTap: () async { await _pickImage(); },
                      child: selectedImage != null 
                        ? ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.file(File(selectedImage!.path), height: 200, width: double.infinity, fit: BoxFit.cover))
                        : Container(height: 200, decoration: BoxDecoration(color: const Color.fromARGB(255,64,63,63), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)), child:
                          const Center(child:
                            Text("Tap to select an image", style: TextStyle(color: Colors.white))),
                        ),
                    ),
                    const SizedBox(height: 10),
                    Center(child:
                      Row(mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          GestureDetector(onTap:
                            () { removeOverlay(); },child:
                            const CircleAvatar(backgroundColor:
                              Color(0xFFD9534F),child:
                              Icon(Icons.close,color:
                                Colors.white),),
                          ),
                          GestureDetector(onTap:
                            () async { await _addFood(); removeOverlay(); },child:
                            const CircleAvatar(backgroundColor:
                              Color(0xFF4CAF50),child:
                              Icon(Icons.check,color:
                                Colors.white),),
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

    Overlay.of(context).insert(overlayEntry!);
}

Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage = image;
        overlayEntry?.markNeedsBuild();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
}

Future<void> _addFood() async {
    if (selectedImage != null) {
      await isar.writeTxn((isar) async {
        final newFood = Food()
          ..name = nameController.text // Get input from user
          ..category = "Sweets"
          ..description = descriptionController.text // Get input from user
          ..price = double.tryParse(priceController.text) ?? 0.0; // Get input from user

        await isar.foods.put(newFood);
      } as Future Function());
    }
}

void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
}
}
