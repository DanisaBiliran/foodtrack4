import 'package:isar/isar.dart';

part 'food.g.dart'; // Ensure this line is present

@Collection()
class Food {
  Id id = Isar.autoIncrement; // Auto-increment ID
  late String name;
  late String category; // e.g., 'Sweets'
  late String description;
  late double price;
}
