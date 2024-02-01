import 'package:cashier/Main_Screens/Cashier_Pages.dart';
import 'package:cashier/Main_Screens/Orders_page.dart';
import 'package:cashier/Main_Screens/PrintScreen.dart';
import 'package:cashier/Main_Screens/Settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
   Cashier_page(order: ""),

    PrintScreen(title: "", order: "", price:0),
    Settings_page()
  ];
  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home, size: 30),          /// 30.0
      Icon(Icons.search, size: 30),
      Icon(Icons.shopping_cart, size: 30),
      Icon(Icons.favorite, size: 30),

    ];
    Size size = MediaQuery.of(context).size;
    return Container(
      color:Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: screen[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white)
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.black45,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.black,
              height: 30,               /// 60.0
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
