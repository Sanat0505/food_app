
class Food{
  final String id;
  final String name;
  final String imagePath;
  final String catagory;
  final double price;
  final double discount;
  final double rating;

  Food({required this.id, required this.name, required this.imagePath, required this.catagory, required this.price, required this.discount, required this.rating});
}

final foods = [
  Food(
    id: "1",
    name: "Hot Coffee",
    imagePath: "assets/images/breakfast.png",
    catagory: "1",
    price: 22.0,
    discount: 33.5,
    rating: 99.0,
  ),
  Food(
    id: "2",
    name: "Grilled Chicken",
    imagePath: "assets/images/grilledchicken.jpg",
    catagory: "2",
    price: 12.0,
    discount: 34.5,
    rating: 69.0,
  ),
];