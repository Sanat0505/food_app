import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/models/Methods.dart';
import 'package:food_app/src/pages/signin_page.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/screens/main_screen.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{

  bool _toggelVisibility = true;
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final MainModel mainModel = MainModel();



  Widget _buildEmailTextField(){
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
          hintText: "Enter Email",
          hintStyle: TextStyle(
            color: Color(0XFFBDC2CB),
            fontSize: 18.0,
            fontFamily: "SecularOne",
          ),
      ),
    );
  }

   Widget _buildUsernameTextField(){
     return TextFormField(
       controller: _username,
       decoration: InputDecoration(
           hintText: "Enter Username",
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

  // Widget _buildConfirmPasswordField(){
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       hintText: "Confirm Password",
  //       hintStyle: TextStyle(
  //         color: Color(0XFFBDC2CB),
  //         fontSize: 18.0,
  //         fontFamily: "SecularOne",
  //       ),
  //       suffixIcon: IconButton(
  //         icon:_toggleConfirmVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
  //         onPressed: () {
  //           setState(() {
  //             _toggleConfirmVisibility = !_toggleConfirmVisibility;
  //           });
  //         },
  //       ),
  //     ),
  //     obscureText: _toggleConfirmVisibility,
  //   );
  // }

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
          : Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:<Widget> [
            Text("Sign Up",
              style: TextStyle(
                fontFamily: "SecularOne",
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(height: 50.0,),
            // SizedBox(height: 20.0,),
            Card(
              elevation: 10.0,
              child :Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children:<Widget> [
                    _buildUsernameTextField(),
                    SizedBox(height: 20.0,),
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordField(),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            _buildSignupButton(),
            Divider(height: 20.0,color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text(
                  "Already have an account ?",
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SignInPage()));
                  },
                  child: Text(
                    "Sign In",
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
  Widget _buildSignupButton(){
    return GestureDetector(
      onTap: (){
        if(!_username.text.isEmpty && !_password.text.isEmpty && !_email.text.isEmpty){
          setState(() {
            isLoading = true;
          });
          createAccount(_username.text, _email.text, _password.text)
              .then((user) {
             if(user!= null){
               setState(() {
                 isLoading = false;
               });
               print("LogIn Successful..");
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MainScreen(model: mainModel,)));
             }else{
               print("LogIn Failed..");
             }
          });
        }else{
          print("Please enter Fields");
        }
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: "SecularOne",
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}