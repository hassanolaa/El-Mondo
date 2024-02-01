import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:cashier/Main_Screens/History_page.dart';
 import 'package:cashier/Main_Screens/Order_Screen.dart';
import 'package:cashier/Main_Screens/Orders_page.dart';
import 'package:cashier/data/price.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

import 'Home_Screen.dart';

class Cashier_page extends StatefulWidget {
  int? selectedIndex;

  int price=0;
  String order="";
   Cashier_page({
    this.selectedIndex,
   required  this.order
    }) ;

  @override
  State<Cashier_page> createState() => _Cashier_pageState();
}

class _Cashier_pageState extends State<Cashier_page> {
  @override

  int brugerCount=0;
  int CrisbyCount=0;
  int FajetaCount=0;
  int SotehCount=0;
  int BaconCount=0;
  int CreamyCount=0;
  int pulledCount=0;
  int HomeMadeCount=0;
  int ChickenCount=0;
  int AsadoCount=0;
  int GralicCount=0;
  int kebdaCount=0;
  int sogo2Count=0;
  String price2="";
  int wid=0;
  bool visable=false;
  int orderCounter=0;

  String order="";
  static const List<String> MenuFilter = [
    'Create',
    'Clear',
    'Active',

  ];

  void _dialogLocation() async {
    locationDialog({
      required AlignmentGeometry alignment,
      double width = double.infinity,
      double height = double.infinity,
    }) async {
      SmartDialog.show(
        alignment: alignment,
        builder: (_) => Container(width: width, height: height, color:Colors.white),
      );
      await Future.delayed(Duration(milliseconds: 500));
    }

    //left
    await locationDialog(width: 70, alignment: Alignment.centerLeft);
    //top

  }
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(

                  child:CrisbyBurger() ,

            ));
          });
        });
  }


  Widget MostOrderd(){
    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xFFFBC02D),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Most Ordared",style: TextStyle(color:Colors.black,fontSize: 18),),
              ),
            ),
          ],
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 80,),
            GestureDetector(
             onTap: (){
              setState(() {
                 //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
              SmartDialog.show(builder: (context) {
                return CrisbyBurger();
              });
               //showInformationDialog(context);



               });
             },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFFBC02D),
                ),
                height: 238,
                width: 300,

                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/QTP0z6u.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Crispy Quinoa Burgers",style: GoogleFonts.robotoSlab(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          },
                             child: Text("100 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),),


                          ),
                          SizedBox(height: 5,),
                          Text("75 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))

                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:
                                Text("150 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),),

                          ),
                          SizedBox(height: 5,),
                          Text("100 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))

                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("200 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("135 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color:Colors.black,))

                        ],
                      ),


                    ],),

                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: (){
              setState(() {
                  //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                  SmartDialog.show(builder: (context) {
                    return ChickenFajeta();
                  });

                });
              },
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFFBC02D),
                ),
                height: 238,
                width: 300,


                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/BC2VTB4.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Applebee's Chicken Fajita",style: GoogleFonts.robotoSlab(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("145 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("190 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),






                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: (){
               setState(() {
                  //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                  SmartDialog.show(builder: (context) {
                    return odarSoteh();
                  });

                });
              },
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFFBC02D),
                ),
                height: 238,
                width: 300,

                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/BoGwTXK.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("5odar soteh",style: GoogleFonts.robotoSlab(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                      }, child:Text("Rice",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                      SizedBox(width: 70,),
                      TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                      }, child:Text("Pasta",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                      SizedBox(width: 20,),



                    ],),
                    SizedBox(height: 5,),
                    Text("160 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))


                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: (){
   setState(() {
    //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
    SmartDialog.show(builder: (context) {
    return BaconSteak();
    });
    });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFFBC02D),
                ),
                height: 238,
                width: 300,

                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/DL2b4Kx.jpg",fit: BoxFit.fitWidth,)),

                    SizedBox(height: 15,),
                    Text("Quesadilla Bacon Steak",style: GoogleFonts.robotoSlab(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                      }, child:Text("Original",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                      SizedBox(width: 70,),
                      TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                      }, child:Text("Spicy",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                      SizedBox(width: 20,),



                    ],),
                    SizedBox(height: 5,),
                    Text("175 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))


                  ],
                ),
              ),
            ),
          ],
        ),




      ],
    );
  }
  Widget MainMeals(){
    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xFFFBC02D),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Main Meals",style: TextStyle(color:  Colors.black,fontSize: 20),),
              ),
            ),
          ],
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 80,),
            GestureDetector(
             onTap: (){
               setState(() {
                 //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                 SmartDialog.show(builder: (context) {
                   return CreamyChicken();
                 });

               });
             },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/oMVfC2F.jpg",fit: BoxFit.fitWidth,)),

                    SizedBox(height: 15,),
                    Text("Creamy Chicken Marsala",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("135 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("180 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),




                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
            onTap: (){
              setState(() {
                //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                SmartDialog.show(builder: (context) {
                  return RulledPork();
                });

              });
            },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),

                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/bHvTjYM.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Pulled Pork",style: TextStyle(color:  Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          },
                            child: Text("100 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),),


                          ),
                          SizedBox(height: 5,),
                          Text("90 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))

                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:
                          Text("150 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),),

                          ),
                          SizedBox(height: 5,),
                          Text("130 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))

                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("200 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("165 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color:Colors.black,))

                        ],
                      ),


                    ],),



                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: (){
                setState(() {
                  //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                  SmartDialog.show(builder: (context) {
                    return Homemade();
                  });

                });
              },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/E7FUSrj.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Homemade Ratatouille",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("95 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("140 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),


                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
             onTap: (){
               setState(() {
                 //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                 SmartDialog.show(builder: (context) {
                   return ChcikenNuch();
                 });

               });
             },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/MhcBtQn.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Chicken Enchiladas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("90 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("130 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),


                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 35,),
        Row(
          children: [
            SizedBox(width: 80,),
            GestureDetector(
              onTap: (){
                setState(() {
                  //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                  SmartDialog.show(builder: (context) {
                    return Asado();
                  });

                });
              },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/SBFBUe3.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Asado chicken breast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("120 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("180 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),


                  ],
                ),
              ),
            ),
            SizedBox(width: 40,),
            GestureDetector(
              onTap: (){
                setState(() {
                  //      QuickAlert.show(backgroundColor:Color(0xFFFBC02D) ,width: 300,context: context,type: QuickAlertType.confirm,widget: All());
                  SmartDialog.show(builder: (context) {
                    return Grilc();
                  });

                });
              },
              child: Container(
                height: 238,
                width: 300,
                color: Color(0xFFFBC02D),

                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 300
                        ,child: Image.network("https://i.imgur.com/5DZjfHT.jpg",fit: BoxFit.fitWidth,)),
                    SizedBox(height: 15,),
                    Text("Gralic butter chicken",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(children: [
                      SizedBox(width: 45,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
                          SizedBox(height: 5,),
                          Text("160 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                          }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
                          SizedBox(height: 5,),
                          Text("210 LE",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13 ,  color: Colors.black,))
                        ],
                      ),
                      SizedBox(width: 20,),



                    ],),




                  ],
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 45,),






      ],
    );
  }
  Widget Sandwich(){
    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Sandwich ",style: TextStyle(color:Colors.white,fontSize: 20),),
              ),
            ),
          ],
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 80,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/o3EhhHO.jpg",fit: BoxFit.fitWidth,)),
                  Text("Dorian Smokehouses",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),


                  ],),
                  Row(children: [
                    SizedBox(width: 20,),

                    IconButton(onPressed: (){
                      setState(() {
                        brugerCount++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),

                    Text("$brugerCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
                    IconButton(onPressed: (){
                      setState(() {
                        brugerCount--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),

                    TextButton(onPressed:(){
                      widget.order=widget.order+"$brugerCount burger                                                                          55 LE\n  \n \n ";
                      widget.price=widget.price+(brugerCount*price().burger);

                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white)),

                  ],),

                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,

              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/LCSeYOA.jpg",fit: BoxFit.fitWidth,)),
                  Text("Roasted Beef Grilled",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),

                  Row(children: [
                    SizedBox(width: 20,),

                    IconButton(onPressed: (){
                      setState(() {
                        kebdaCount++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),

                    Text("$kebdaCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
                    IconButton(onPressed: (){
                      setState(() {
                        kebdaCount--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),

                    TextButton(onPressed:(){
                      widget.order=widget.order+"+$kebdaCount kebda                                                                         40 LE\n  \n \n ";
                      widget.price=widget.price+(kebdaCount*price().kebda);

                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white)),

                  ],),



                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/K9X2NDu.jpg",fit: BoxFit.fitWidth,)),
                  Text("Nathan’s cheesesteaks",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),
                  Row(children: [
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),
                    Text("$sogo2Count",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),
                    TextButton(onPressed:(){
                      widget.order=widget.order+"$sogo2Count sogo2 \n  \n";
                      widget.price=widget.price+(sogo2Count*price().sogo2);
                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white),)

                  ],),

                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/B99Eh6C.jpg",fit: BoxFit.fitWidth,)),
                  Text("Flock Smokehouses ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),
                  Row(children: [
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),
                    Text("$sogo2Count",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),
                    TextButton(onPressed:(){
                      widget.order=widget.order+"$sogo2Count sogo2 \n  \n";
                      widget.price=widget.price+(kebdaCount*price().sogo2);
                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white),)

                  ],),

                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 35,),







      ],
    );
  }
  Widget Drinks(){
    return Column(

      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Drinks ",style: TextStyle(color:Colors.white,fontSize: 20),),
              ),
            ),
          ],
        ),
        SizedBox(height: 25,),
        Row(
          children: [
            SizedBox(width: 80,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/LZkl4Jr.jpg",fit: BoxFit.fitWidth,)),
                  Text("margaritas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),


                  ],),
                  Row(children: [
                    SizedBox(width: 20,),

                    IconButton(onPressed: (){
                      setState(() {
                        brugerCount++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),

                    Text("$brugerCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
                    IconButton(onPressed: (){
                      setState(() {
                        brugerCount--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),

                    TextButton(onPressed:(){
                      widget.order=widget.order+"$brugerCount burger                                                                          55 LE\n  \n \n ";
                      widget.price=widget.price+(brugerCount*price().burger);

                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white)),

                  ],),

                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,

              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/1DqLyyl.jpg",fit: BoxFit.fitWidth,)),
                  Text("Soda",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),

                  Row(children: [
                    SizedBox(width: 20,),

                    IconButton(onPressed: (){
                      setState(() {
                        kebdaCount++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),

                    Text("$kebdaCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
                    IconButton(onPressed: (){
                      setState(() {
                        kebdaCount--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),

                    TextButton(onPressed:(){
                      widget.order=widget.order+"+$kebdaCount kebda                                                                         40 LE\n  \n \n ";
                      widget.price=widget.price+(kebdaCount*price().kebda);

                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white)),

                  ],),



                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/xV0ELEQ.jpg",fit: BoxFit.fitWidth,)),
                  Text("P.F. Chang’s",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),
                  Row(children: [
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),
                    Text("$sogo2Count",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),
                    TextButton(onPressed:(){
                      widget.order=widget.order+"$sogo2Count sogo2 \n  \n";
                      widget.price=widget.price+(sogo2Count*price().sogo2);
                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white),)

                  ],),

                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 238,
              width: 300,
              color: Colors.cyan,
              child: Column(
                children: [
                  Container(
                      height: 130,
                      width: 300
                      ,child: Image.network("https://i.imgur.com/E1pkkbM.jpg",fit: BoxFit.fitWidth,)),
                  Text("mezcal mule ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(children: [
                    SizedBox(width: 45,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 70,),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
                    }, child:Text("Delete",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ),)),
                    SizedBox(width: 20,),



                  ],),
                  Row(children: [
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count++;
                      });
                    }, icon:Icon(Icons.plus_one,size: 24,)),
                    SizedBox(width: 10,),
                    Text("$sogo2Count",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){
                      setState(() {
                        sogo2Count--;

                      });
                    }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
                    SizedBox(width: 50,),
                    TextButton(onPressed:(){
                      widget.order=widget.order+"$sogo2Count sogo2 \n  \n";
                      widget.price=widget.price+(kebdaCount*price().sogo2);
                    },child: Text("add",style: TextStyle(color: Colors.cyan),),style: TextButton.styleFrom(backgroundColor: Colors.white),)

                  ],),

                ],
              ),
            ),
          ],
        ),







      ],
    );
  }
  Widget Order(){
    Future getUserinfo() async{
      await FirebaseFirestore.instance.collection('orderCounter').add({
        'counter':orderCounter++,


      });

      print('hassan');
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFFBC02D)),

        color: Color(0xFFFBC02D),
      ),
      height: 370,
      width: 440,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        height: 350,
        width: 400,

        child: Column(
          children: [
            SizedBox(height: 8,),
            Text(
              "Order :",style: TextStyle(fontSize: 20,color: Color(0xFFFBC02D),),
            ),
           SizedBox(height: 15,),
            Text(
              widget.order,style: TextStyle(color: Color(0xFFFBC02D),),
            ),
            SizedBox(height: 8,),
        Text("Total Amount                           "+widget.price.toString()+" LE \n",style: TextStyle(fontSize: 15,color: Color(0xFFFBC02D),),),
            SizedBox(height: 8,),
        Row(
          children: [
          SizedBox(width: 120,),
            GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:
                      (contxet)=> Home_Screen()));
                },
                child: Icon(CupertinoIcons.clear_circled,color: Color(0xFFFBC02D),size: 35,)),
          SizedBox(width: 110,),
          GestureDetector(
              onTap: (){

                Navigator.push(context,MaterialPageRoute(builder:
                    (contxet)=> Order_Screen(order: widget.order,price: widget.price,orderCounter: orderCounter,)));
                setState(() {
                //  getUserinfo();
                });
              },
              child: Icon(CupertinoIcons.check_mark_circled,        color: Color(0xFFFBC02D),size: 35,)),
          ],
            ),

          ],
        ),
      ),
    );
  }
  Widget CrisbyBurger(){
   late int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFBC02D),
      ),
      height: 238,
      width: 300,

      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/QTP0z6u.jpg",fit: BoxFit.fitWidth,)),
          Text("Crispy Quinoa Burgers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: color),onPressed: (){
              setState(() {
                price=75;
                Size="100 gm";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("100 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 20,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=100;
                Size="150 gm";
                color=Colors.white;
                total=count*price;

              });
            }, child:Text("150 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 20,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=135;
                Size="200 gm";
                color=Colors.white;
                total=count*price;

              });
            }, child:Text("200 gm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),


          ],),
          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                CrisbyCount++;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text(count.toString(),style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
         //   AnimatedFlipCounter(
         //     duration: Duration(milliseconds: 500),
          //    value: count, // pass in a value like 2014
        //    ),
            IconButton(onPressed: (){
              setState(() {
                count--;
                CrisbyCount--;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Crispy Quinoa Burgers         $Size                  $price LE                  $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color:   Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),

        ],
      ),
    );
  }
  Widget ChickenFajeta(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;

    return  Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFBC02D),
      ),
      height: 238,
      width: 300,


      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/BC2VTB4.jpg",fit: BoxFit.fitWidth,)),
          Text("Applebee's Chicken Fajita",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: color),onPressed: (){
              setState(() {
                price=145;
                Size="M";
                color=Colors.white;
                total=count*price;

              });
            }, child:Text("M",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=190;
                Size="L";
                color=Colors.white;
                total=count*price;

              });
            }, child:Text("L",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
            SizedBox(width: 20,),



          ],),

          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                FajetaCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text(count.toString(),style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                FajetaCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Applebee's Chicken Fajita      $Size                    $price LE                      $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color:   Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),



        ],
      ),
    );
  }
  Widget odarSoteh(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;

    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFBC02D),
      ),
      height: 238,
      width: 300,

      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/BoGwTXK.jpg",fit: BoxFit.fitWidth,)),
          Text("5odar soteh",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=160;
                Size="Rice";
                color=Colors.white;
                total=count*price;


              });

            }, child:Text("Rice",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=160;
                Size="Pasta";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("Pasta",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 20,),



          ],),
          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                SotehCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text(count.toString(),style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                SotehCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count 5odar Soteh                    $Size                 $price LE                     $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color:   Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),


        ],
      ),
    );
  }
  Widget BaconSteak(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFBC02D),
      ),
      height: 238,
      width: 300,

      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/DL2b4Kx.jpg",fit: BoxFit.fitWidth,)),
          Text("Quesadilla Bacon Steak",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=175;
                Size="Original";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("Original",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8,  color: Color(0xFFFBC02D), ),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=175;
                Size="Spicy";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("Spicy",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 8 ,  color: Color(0xFFFBC02D),),)),
            SizedBox(width: 20,),



          ],),
          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                BaconCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text(count.toString(),style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                BaconCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"$count Quesadilla Bacon Steak          $Size                    $price LE                   $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color:   Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),


        ],
      ),
    );
  }
  Widget CreamyChicken(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/oMVfC2F.jpg",fit: BoxFit.fitWidth,)),
          Text("Creamy Chicken Marsala",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor:   Colors.black,),onPressed: (){
              setState(() {
                price=135;
                Size="M";
                color=Colors.white;
                total=count*price;


              });

            }, child:Text("M",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),

            SizedBox(width: 50,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black,),onPressed: (){
              setState(() {
                price=180;
                Size="L";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("L",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),


          ],),
          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                CreamyCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text("$CreamyCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                CreamyCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Creamy Chicken Marsala         $Size                 $price LE                        $total LE\n  \n \n ";
              widget.price=widget.price+(CreamyCount*price);
              setState(() {
                visable=true;
              });
            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black,)),

          ],),

        ],
      ),
    );
  }
  Widget RulledPork(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),

      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/bHvTjYM.jpg",fit: BoxFit.fitWidth,)),
          Text("Pulled Pork",style: TextStyle(color:  Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor:   Colors.black,),onPressed: (){
              setState(() {
                price=90;
                Size="100 gm";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("100 gm",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),
            TextButton(style: TextButton.styleFrom(backgroundColor:   Colors.black,),onPressed: (){
              setState(() {
                price=130;
                Size="150 gm";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("150 gm",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black,),onPressed: (){
              setState(() {
                price=165;
                Size="200 gm";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("200 gm",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),


          ],),

          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
                pulledCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text("$pulledCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                pulledCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Pulled Pork                 $Size             $price LE                 $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });
            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),



        ],
      ),
    );
  }
  Widget Homemade(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/E7FUSrj.jpg",fit: BoxFit.fitWidth,)),
          Text("Homemade Ratatouille",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor:  Colors.black),onPressed: (){
              setState(() {
                price=95;
                Size="M";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("M",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor:  Colors.black),onPressed: (){
              setState(() {
                price=140;
                Size="L";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("L",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),



          ],),
          Row(children: [
            SizedBox(width: 20,),
            IconButton(onPressed: (){
              setState(() {
                count++;
                HomeMadeCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),
            Text("$HomeMadeCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
            IconButton(onPressed: (){
              setState(() {
                count--;
                HomeMadeCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),
            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Homemade Ratatouille        $Size                 $price LE                        $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });
            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D)),),style: TextButton.styleFrom(backgroundColor:  Colors.black),)

          ],),

        ],
      ),
    );
  }
  Widget ChcikenNuch(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/MhcBtQn.jpg",fit: BoxFit.fitWidth,)),
          Text("Chicken Enchiladas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=90;
                Size="M";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("M",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor:  Colors.black),onPressed: (){
              setState(() {
                price=130;
                Size="L";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("L",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),



          ],),
          Row(children: [
            SizedBox(width: 20,),
            IconButton(onPressed: (){
              setState(() {
                count++;
                ChickenCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),
            Text("$ChickenCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold),),
            IconButton(onPressed: (){
              setState(() {
                count--;
               ChickenCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),
            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Chicken Enchiladas          $Size                 $price LE                        $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });
            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D)),),style: TextButton.styleFrom(backgroundColor:  Colors.black),)

          ],),

        ],
      ),
    );
  }
  Widget Asado(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),
      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/SBFBUe3.jpg",fit: BoxFit.fitWidth,)),
          Text("Asado chicken breast",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=120;
                Size="M";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("M",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=180;
                Size="L";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("L",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),



          ],),
          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
             AsadoCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text("$AsadoCount",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
                AsadoCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Asado chicken breast           $Size                 $price LE                        $total LE\n  \n \n ";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D)),),style: TextButton.styleFrom(backgroundColor:  Colors.black),)
          ],),

        ],
      ),
    );
  }
  Widget Grilc(){
    int count=0;
    int price=0;
    String Size="";
    Color color=Colors.black;
    int total=count*price;
    return Container(
      height: 238,
      width: 300,
      color: Color(0xFFFBC02D),

      child: Column(
        children: [
          Container(
              height: 130,
              width: 300
              ,child: Image.network("https://i.imgur.com/5DZjfHT.jpg",fit: BoxFit.fitWidth,)),
          Text("Gralic butter chicken",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 45,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=160;
                Size="M";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("M",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 70,),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
              setState(() {
                price=210;
                Size="L";
                color=Colors.white;
                total=count*price;


              });
            }, child:Text("L",style: TextStyle(color: Color(0xFFFBC02D),fontWeight:FontWeight.bold,fontSize: 8 ),)),
            SizedBox(width: 20,),



          ],),

          Row(children: [
            SizedBox(width: 20,),

            IconButton(onPressed: (){
              setState(() {
                count++;
              // GralicCount=count;
              });
            }, icon:Icon(Icons.plus_one,size: 24,)),
            SizedBox(width: 10,),

            Text("$count",style: TextStyle(fontSize: 17.5,fontWeight: FontWeight.bold)),
            IconButton(onPressed: (){
              setState(() {
                count--;
               // GralicCount=count;

              });
            }, icon:Icon(Icons.exposure_minus_1,size: 24,)),
            SizedBox(width: 50,),

            TextButton(onPressed:(){
              setState(() {
                total=count*price;
              });
              widget.order=widget.order+"x$count Gralic butter chicken          $Size                 $price LE                        $total LE\n  \n \n";
              widget.price=widget.price+(count*price);
              setState(() {
                visable=true;
              });

            },child: Text("add",style: TextStyle(color: Color(0xFFFBC02D),),),style: TextButton.styleFrom(backgroundColor: Colors.black)),

          ],),



        ],
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFBC02D),   Color(0xFFFBC02D),],begin:Alignment.centerLeft,end: Alignment.centerRight )),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Center(child: Text('Cashier',style: GoogleFonts.robotoSlab(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white ),),),
          ],
        ),


      ),
      body: SingleChildScrollView(
     child:Column(
       children: [
        SizedBox(height: 10,),
         Row(

           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 Row(

                   children: [
                   SizedBox(width: 50,),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0,0,400,20),
                       child: Container(
                           height: 150,
                           width: 330
                           ,child: Image.network("https://i.imgur.com/v3dvpCE.gif",fit: BoxFit.fitWidth,scale: 20,)),
                     ),

                   ],
                 ),
                 SizedBox(height: 5,),
                 Row(children: [
                   SizedBox(width: 50,),
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         wid=0;
                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color:wid==0? Colors.white:Color(0xFFFBC02D),
                       ),
                       height: 100,
                       width: 100,
                       child: Column(
                         children: [
                           SizedBox(height: 30,),
                           Icon(Icons.whatshot,size: 25,),
                           SizedBox(height: 10,)
                           ,Text("Most Orderd"),
                         ],
                       ),),
                   ),
                   SizedBox(width: 25,),
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         wid=1;
                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color:wid==1? Colors.white:Color(0xFFFBC02D),
                       ),
                       height: 100,
                       width: 100,
                       child: Column(
                         children: [
                           SizedBox(height: 30,),
                           Icon(Icons.set_meal_outlined,size: 25,),
                           SizedBox(height: 10,)
                           ,Text("Main Meals"),
                         ],
                       ),),
                   ),
                   SizedBox(width: 25,), GestureDetector(
                     onTap: (){
                       setState(() {
                         wid=2;
                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color:wid==2? Colors.white:Color(0xFFFBC02D),

                       ),
                       height: 100,
                       width: 100,
                       child: Column(
                         children: [
                           SizedBox(height: 30,),
                           Icon(Icons.fastfood_outlined,size: 25,),
                           SizedBox(height: 10,)
                           ,Text("Sandwich"),
                         ],
                       ),),
                   ),
                   SizedBox(width: 25,),GestureDetector(
                     onTap: (){
                       setState(() {
                         wid=3;
                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color:wid==3? Colors.white:Color(0xFFFBC02D),

                       ),
                       height: 100,
                       width: 100,
                       child: Column(
                         children: [
                           SizedBox(height: 30,),
                           Icon(Icons.local_drink_outlined,size: 25,),
                           SizedBox(height: 10,)
                           ,Text("Drinks"),
                         ],
                       ),),
                   ),
                   SizedBox(width: 25,), GestureDetector(
                     onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder:
                           (contxet)=> Order_Screen(order: widget.order,price: widget.price,orderCounter: orderCounter,)));
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Color(0xFFFBC02D),
                       ),
                       height: 100,
                       width: 100,
                       child: Icon(Icons.whatshot),),
                   ),

                 ],),
               ],
             ),
             SizedBox(width: 300,),
             Column(children: [
             if(visable)...{
               Animate(
                 effects: [FadeEffect(), ScaleEffect()],
                 child: Order(),
               )

             }

             ],)
           ],
         ),


         SizedBox(width: 300,height: 15,),
         if(wid == 0)...[
         //Text("A is greater than 10"),
        MostOrderd(),
      ], if(wid==1)...[
        MainMeals(),
       ], if(wid==2)...[
   Sandwich(),
  ],if(wid==3)...[
           Drinks(),
         ]
    ]
     ) ,

      ),
    );
  }
}
