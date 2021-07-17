import 'dart:convert';

import 'package:food_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food_app/src/data/food_data.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{
  List<Food> _foods = [];

  List<Food> get foods{
    return List.from(_foods);
  }

  void addFood(Food food){
    _foods.add(food);
  }

  void fetchFood(){
    http.get(Uri.parse("http://192.168.43.15/flutter_food_app/api/foods/getFoods.php")).then((http.Response response){
      //print("Featching Data: ${response.body}");
      final List fetchedData = jsonDecode(response.body);
      final List<Food> fetchedFoodItems = [];
      //print(fetchedData);
      fetchedData.forEach((data) {
        Food food = Food(
          id: data["id"],
          category: data["catagory_id"],
          description: 'description',
          discount: double.parse(data["discount"]),
          imagePath: data["image_path"],
          name: data["title"],
          price: double.parse(data["price"]),
          ratings: 2.0,
        );

        fetchedFoodItems.add(food);
      });

      _foods = fetchedFoodItems;
      print(_foods);
    });

  }
}