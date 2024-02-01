import 'package:cashier/Main_Screens/Cashier_Pages.dart';
import 'package:cashier/Main_Screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Cashier_OTP extends StatefulWidget {
  const Cashier_OTP({Key? key}) : super(key: key);

  @override
  State<Cashier_OTP> createState() => _Cashier_OTPState();
}

class _Cashier_OTPState extends State<Cashier_OTP> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:NetworkImage('https://i.imgur.com/YRsyiVK.gif'),
                fit: BoxFit.cover
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(

              children: [
                SizedBox(height: 200,),
                Container(
                    height: 150,
                    width: 440
                    ,child: Image.network("https://i.imgur.com/z7FBnXt.png",fit: BoxFit.fitWidth,scale: 20,)),
                SizedBox(height: 100,),
                Container(
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFFBC02D)),

                  ),
                  child: OTPTextField(
                      controller: otpController,
                      length: 5,

                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17,color:Color(0xFFFBC02D)),
                      onChanged: (pin) {
                  //     print("Changed: " + pin);
                       if(pin=="12345"){
                         Navigator.push(context,MaterialPageRoute(builder:
                             (contxet)=> Home_Screen()));
                         otpController.clear();


                       }
                      },
                      onCompleted: (pin) {
                    //    print("Completed: " + pin);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
