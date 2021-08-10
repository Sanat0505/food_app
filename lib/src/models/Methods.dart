
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signin_page.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    User? user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password))
    .user;

    if(user != null){
      print("Login Success..");
      return user;
    }else{
      print("Account Creation Failed..");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    User? user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    if(user != null){
      print("Login SuccessFul..");
      return user;
    }else{
      print("Account Creation Failed..");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInPage()));
    });
  }catch(e){
    print("Error..");
    return null;
  }
}