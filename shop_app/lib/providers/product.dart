import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool favourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.favourite = false,
  });
  void toggleFavouriteStatus(){
    favourite = !favourite;
    notifyListeners();
  }
}
