
// class Food{
//   final String id;
//   final String name;
//   final String imagePath;
//   final String category;
//   final double price;
//   final double discount;
//   final double rating;
//
//   Food({required this.id, required this.name, required this.imagePath, required this.catagory, required this.price, required this.discount, required this.rating});
// }

import 'package:food_app/src/models/food_model.dart';

final foods = [
  Food(
    id: "1",
    name: "Hot Coffee",
    imagePath: "assets/images/breakfast.png",
    category: "1",
    price: 99.0,
    discount: 33.5,
    ratings: 99.0, description: 'Its too hot and good',
  ),
  Food(
    id: "2",
    name: "Grilled Chicken",
    imagePath: "assets/images/grilledchicken.jpg",
    category: "2",
    price: 330.0,
    discount: 34.5,
    ratings: 69.0, description: 'It is too spicy with hot soop',
  ),
];