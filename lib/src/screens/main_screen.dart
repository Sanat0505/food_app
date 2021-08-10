import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';
import 'package:food_app/src/models/Methods.dart';
import 'package:food_app/src/pages/favourite_page.dart';
import 'package:food_app/src/pages/profile_page.dart';
import 'package:food_app/src/pages/signin_page.dart';
import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
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

  int currentTab = 0;
  late List<Widget> pages;
  late Widget currentPage;

  late HomePage homePage;
  late OrderPage orderPage;
  late FavouritePage favouritePage;
  late ProfilePage profilePage;

  // late List<Widget> pages;
  // late Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState

    //widget.foodModel.fetchFood();
    widget.model.fetchFood();
    homePage = HomePage();
    orderPage = OrderPage();
    favouritePage = FavouritePage();
    profilePage = ProfilePage();
    pages = [homePage, favouritePage, orderPage, profilePage];

    currentPage = homePage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  // size: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
            currentTab == 3
                ? ScopedModelDescendant(builder:
                (BuildContext context, Widget child, MainModel model) {
                  return IconButton(
                      icon: Icon(
                          Icons.logout,
                          color: Theme.of(context).primaryColor,
                      ),
                    onPressed: () {

                    },
              );
            })
                : IconButton(
              icon: _buildShopingCart(),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context)=>AddFoodItem())
                  );
                },
                leading: Icon(Icons.list),
                title: Text("Add Food Item",
                style: TextStyle(
                  fontSize: 16.0,
                ),),
              ),
              ListTile(
                onTap: (){
                  logOut(context);
                },
                leading: Icon(Icons.arrow_back),
                title: Text("Sign Out",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTab,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home",style: TextStyle(fontFamily: "SecularOne"),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text("Explore",style: TextStyle(fontFamily: "SecularOne"),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Orders",style: TextStyle(fontFamily: "SecularOne"),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile",style: TextStyle(fontFamily: "SecularOne"),),
            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }

  Widget _buildShopingCart(){
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          // size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
