import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget{
  _BoughtFoodsState createState() => _BoughtFoodsState();
}
class _BoughtFoodsState extends State<BoughtFoods>{
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        children: <Widget>[
          Container(
            // height: 200.0,
            // width: 350.0,
            child:  Image.asset("assets/images/breakfast.png"),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
              height: 60.0,
              width: 400.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,Colors.black12,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
             child : Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      "Hot Cofee with Samosa",
                      style: TextStyle(
                        color:  Colors.white,
                        fontFamily: 'SecularOne',
                        fontSize: 18.0,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                    Row(
                      children:<Widget> [
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        SizedBox(width: 20.0,),
                        Text(
                          "(25.0 Reviews)",
                          style: TextStyle(
                            color:  Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            fontFamily: 'SecularOne',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children:<Widget> [
                    Text(
                      "22.0",
                      style:  TextStyle(
                        color: Colors.orangeAccent,
                        fontFamily: 'SecularOne',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                    Text(
                      "Min Order",
                      style:  TextStyle(
                        color: Colors.grey,
                        fontFamily: 'SecularOne',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}