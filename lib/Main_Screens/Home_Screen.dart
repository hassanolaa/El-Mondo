import 'package:cashier/Main_Screens/Cashier_OTP.dart';
import 'package:cashier/Main_Screens/PrintScreen.dart';
import 'package:cashier/SignUpScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cashier/Main_Screens/Cashier_Pages.dart';
import 'package:cashier/Main_Screens/History_page.dart';
import 'package:cashier/Main_Screens/Orders_page.dart';
import 'package:cashier/Main_Screens/Settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  var Screens=[Cashier_page(order: ""),
    //Cashier_OTP(),
    Orders_page(order: "",),History_page(),Settings_page()];
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child:
    CupertinoTabScaffold(resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        backgroundColor:Colors.black,
        items: [
          BottomNavigationBarItem(label: "Home",icon:Icon(Icons.account_balance_sharp,color: Color(0xFFFBC02D),)),
          BottomNavigationBarItem(label: "Orders",icon:Icon(Icons.reorder,color: Color(0xFFFBC02D),)),
          BottomNavigationBarItem(label: "History",icon:Icon(Icons.bookmark_border,color: Color(0xFFFBC02D),)),
          BottomNavigationBarItem(label: "Statistics",icon:Icon(Icons.analytics_outlined,color: Color(0xFFFBC02D),)),
        ],
      ),
      tabBuilder: (BuildContext context,int index){
        return Screens[index];
      },
    ));
  }
}
