import 'dart:convert';

import 'package:food_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:food_app/src/data/food_data.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{
  List<Food> _foods = [];
  bool _isLoading = false;

  bool get isLoading{
    return _isLoading;
  }

  List<Food> get foods{
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async{
   // _foods.add(food);
    _isLoading = true;
    notifyListeners();
    try{

      final Map<String, dynamic> foodData = {
        "title": food.name,
        "description": food.description,
        "category": food.category,
        "price": food.price,
        "discount": food.discount,
      };
      final http.Response response = await http.post(Uri.parse("https://food-app-878bb-default-rtdb.firebaseio.com/foods.json"), body: json.encode(foodData));
      final Map<String, dynamic> responseData = json.decode(response.body);

      //print(responseData["name"]);
      Food foodWithId = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price: food.price,
        imagePath: food.imagePath,
        ratings: food.ratings,
      );

      _foods.add(foodWithId);
      print(_foods);

      _foods.add(foodWithId);
      _isLoading = false;
      notifyListeners();
      // fetchFood();
      return Future.value(true);
    }catch(e){
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      print("Connection Error : $e");
    }
  }

  Future<bool> fetchFood() async {
    _isLoading = true;
    notifyListeners();
   try{
     final http.Response response = await http.get(Uri.parse("https://food-app-878bb-default-rtdb.firebaseio.com/foods.json"));

     //print("Featching Data: ${response.body}");
     final Map<String, dynamic> fetchedData = jsonDecode(response.body);
     print(fetchedData);
     final List<Food> foodItems = [];
     fetchedData.forEach((String id, dynamic foodData) {
       Food foodItem = Food(
         id: id,
         name: foodData["title"],
         description: foodData["description"],
         category: foodData["category"],
         price: double.parse(foodData["price"].toString()),
         discount: double.parse(foodData["discount"].toString()),
         ratings: 89.0,
         imagePath: "assets/images/breakfast.png",
       );
       foodItems.add(foodItem);
     });
     _foods = foodItems;
     _isLoading = false;
     notifyListeners();
     return Future.value(true);
   }
   catch(error){
     _isLoading = false;
     notifyListeners();
     return Future.value(false);
   }
}
}