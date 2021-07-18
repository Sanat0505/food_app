import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/pages/food_details_page.dart';
import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/widgets/home_top_info.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/food_category.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_foods.dart';

//Data
import '../data/food_data.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  void initState() {
    // TODO: implement initState
    //widget.foodModel.fetchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0,right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0,),
          SearchField(),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Text(
                "Frequently Bought Foods",
                style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              GestureDetector(
                onTap: (){},
                child : Text(
                  "View All",
                  style: TextStyle(
                      fontFamily: 'SecularOne',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.amber
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model){
              return Column(
                children: model.foods.map(_buildFoodItems).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FoodDetailsPage(food: food,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          catagory: food.category,
          discount: food.discount,
          price: food.price,
          rating: food.ratings,
        ),
      ),
    );
  }
}