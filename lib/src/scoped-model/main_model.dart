import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with FoodModel{
  void fetchAll() {
    fetchFood();
    // fetchUserInfos();
  }

}