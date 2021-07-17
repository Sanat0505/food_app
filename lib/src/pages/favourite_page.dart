import 'package:flutter/material.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/widgets/food_item_card.dart';
import 'package:food_app/src/widgets/small_button.dart';
import 'package:scoped_model/scoped_model.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context,Widget child,MainModel model){
              model.fetchFood();
              List<Food> foods = model.foods;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:foods.map((Food food){
                  return FoodItemCard(
                    food.name,
                    food.description,
                    food.price.toString(),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
