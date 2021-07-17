import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/small_button.dart';

class FoodItemCard extends StatelessWidget {

  final String title ;
  // final String category = "";
  final String descreption ;
  final String price ;
  // final String discount = "";

  FoodItemCard(this.title,this.descreption,this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            offset: Offset(0,2),
            color: Colors.black,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0,),
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/breakfast.png"
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$title",
                style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: 200.0,
                child: Text(
                  "$descreption",
                  style: TextStyle(fontFamily: "SecularOne"),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Text("\u20B9 $price",
                      style: TextStyle(
                        fontFamily: 'SecularOne',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                    SmallButton(btnText: "Buy"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
