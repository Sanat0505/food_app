import 'package:flutter/material.dart';
import 'package:food_app/src/pages/favourite_page.dart';
import 'package:food_app/src/pages/profile_page.dart';
import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
//pages
import '../pages/home_page.dart';
import '../pages/order_page.dart';

class MainScreen extends StatefulWidget {

  final MainModel model;
  MainScreen({required this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;

  late HomePage homePage;
  late OrderPage orderPage;
  late FavouritePage favouritePage;
  late ProfilePage profilePage;

  @override
  void initState() {
    // TODO: implement initState

    //widget.foodModel.fetchFood();
    widget.model.fetchFood();
    homePage = HomePage();
    orderPage = OrderPage();
    favouritePage = FavouritePage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, favouritePage, profilePage];

    currentPage = homePage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home",style: TextStyle(fontFamily: "SecularOne"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Orders",style: TextStyle(fontFamily: "SecularOne"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favourite",style: TextStyle(fontFamily: "SecularOne"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile",style: TextStyle(fontFamily: "SecularOne"),),
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
