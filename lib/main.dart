import 'package:cashier/Main_Screens/Cashier_OTP.dart';
import 'package:cashier/Main_Screens/Home_Screen.dart';
import 'package:cashier/Main_Screens/Settings_page.dart';
import 'package:cashier/Main_Screens/SplashScrren.dart';
import 'package:cashier/bottom_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';


void main() async{
  runApp(const MyApp());

 WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCS-Xz6LXVqFbip5ha07ipprpDVdXbCYLw",
      authDomain: "cashier-10.firebaseapp.com",
      projectId: "cashier-10",
      storageBucket: "cashier-10.appspot.com",
      messagingSenderId: "546414849747",
      appId: "1:546414849747:web:abd0d15eaae43cb9102e26",
      measurementId: "G-CZB4F4WZDT"
  ));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
      navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
    );
  }
}
