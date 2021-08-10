import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/models/Methods.dart';
import 'package:food_app/src/pages/signup_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screens/main_screen.dart';
import 'package:food_app/src/widgets/button.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage>{

  bool _toggelVisibility = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  final MainModel mainModel = MainModel();

  Widget _buildEmailTextField(){
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
        hintText: "Enter Email or Username",
        hintStyle: TextStyle(
          color: Color(0XFFBDC2CB),
          fontSize: 18.0,
          fontFamily: "SecularOne",
        )
      ),
    );
  }

  Widget _buildPasswordField(){
    return TextFormField(
      controller: _password,
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(0XFFBDC2CB),
            fontSize: 18.0,
            fontFamily: "SecularOne",
          ),
        suffixIcon: IconButton(
            icon:_toggelVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                _toggelVisibility = !_toggelVisibility;
              });
            },
        ),
      ),
      obscureText: _toggelVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      resizeToAvoidBottomInset: false,
        body: isLoading
            ? Center(
                child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
          ),
        )
            :Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:<Widget> [
              Text("Sign In",
                style: TextStyle(
                  fontFamily: "SecularOne",
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(height: 100.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                      "Forgotten Password ?",
                      style: TextStyle(
                        fontFamily: "SecularOne",
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
              ],
            ),
            SizedBox(height: 20.0,),
            Card(
              elevation: 10.0,
              child :Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children:<Widget> [
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: (){
                if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                  setState(() {
                    isLoading = true;
                  });
                  logIn(_email.text, _password.text)
                      .then((user){
                        if(user != null){
                          setState(() {
                            isLoading = false;
                          });
                          print("Login Successfull..");
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MainScreen(model: mainModel,)));
                        }else{
                          print("Login Faield..");
                          setState(() {
                            isLoading = false;
                          });
                        }
                  });
                }else{
                  print("Please Enter the field..");
                }
              },
                child: Button(btnText: "Sign In")
            ), //TODO Geasture detectore for navigate to main page
            Divider(height: 20.0,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    fontFamily: "SecularOne",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xFFBDC2CB),
                  ),
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SignUpPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: "SecularOne",
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}