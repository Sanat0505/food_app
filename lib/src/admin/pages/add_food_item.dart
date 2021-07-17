import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  const AddFoodItem({Key? key}) : super(key: key);

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
   String title = "";
   String category ="";
   String description="";
   String price = "";
   String discount="";
  GlobalKey<FormState> _foodItemFromKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  // SnackBar? get snackbar => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Button(btnText: "Add Food Item"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60.0,horizontal: 16.0),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Form(
            key: _foodItemFromKey,
            child: Column(
              children:<Widget> [
                Container(
                  margin:  EdgeInsets.only(bottom: 15.0),

                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("assets/images/noimage.jpg"),
                    ),
                  ),
                ),
                _buildTextFormField("Food Title"),
                _buildTextFormField("Category"),
                _buildTextFormField("Description",maxLine: 5),
                _buildTextFormField("Price"),
                _buildTextFormField("Discount"),
                SizedBox(height: 100.0,),
                ScopedModelDescendant(
                    builder: (BuildContext context,Widget child,MainModel model){
                      return GestureDetector(
                        onTap: (){
                         onSubmit(model.addFood);
                         if(model.isLoading){
                           showLoadingIndicator();
                         }
                        },
                        child: Button(btnText: "Add Food Item"),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSubmit(Function addFood) async {
    if(_foodItemFromKey.currentState!.validate()){
      _foodItemFromKey.currentState!.save();
      // print("The Food title: $title");
      final food = Food(
        name: title,
        category:  category,
        description: description,
        price: double.parse(price),
        id: '',
        discount: double.parse(discount),
        imagePath: '',
        ratings: 0.0,

      );
      var value = await addFood(food);
      if(value){
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
            content: Text("Food item successfully added...")
        );
        _scaffoldStateKey.currentState!.showSnackBar(snackBar);
      }else if(!value){
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
            content: Text("Failed to add food item...")
        );
        _scaffoldStateKey.currentState!.showSnackBar(snackBar);
      }
    }
  }

  Future<void> showLoadingIndicator(){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content: Row(
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(width: 10.0,),
                Text("Adding a item..."),
              ],
            ),
          );
        }
    );
  }

  Widget _buildTextFormField(String hint,{int maxLine = 1}){

    return TextFormField(
      decoration: InputDecoration(hintText: "$hint",),
      maxLines: maxLine,
      keyboardType: hint == "Price" || hint=="Discount" ? TextInputType.number : TextInputType.text,

      // validator: (String value),

      validator: (String ){
        if(hint == "Food Title" && title.isEmpty){
          return"The food title is required";
        }
        if(hint == "Category" && category.isEmpty){
          return "The category is required";
        }
        if(hint == "Description" && description.isEmpty){
          return "the description is required";
        }
        if(hint == "Price" && price.isEmpty){
          return "The price is required";
        }

      },
      onChanged: (String value){
        if(hint == "Food Title"){
          title = value;
        }
        if(hint == "Category"){
          category = value;
        }
        if(hint == "Description"){
          description = value;
        }
        if(hint == "Price"){
          price = value;
        }
        if(hint == "Discount"){
          discount = value;
        }
      },

    );
  }
}

