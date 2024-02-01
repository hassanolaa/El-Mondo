
import 'package:cashier/Main_Screens/Cashier_Pages.dart';
import 'package:cashier/Main_Screens/Home_Screen.dart';
import 'package:cashier/Main_Screens/PrintScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order_Screen extends StatefulWidget {
 String order;
 int price;
 int orderCounter;
   Order_Screen({
  required this.order,
  required this.price,
  required this.orderCounter,
  }) ;

  @override
  State<Order_Screen> createState() => _Order_ScreenState();
}

class _Order_ScreenState extends State<Order_Screen> {
  int theamount=0;
  late String mabla8;
  late String note;
  final note1=TextEditingController();
  DateTime current_date = DateTime.now();
  int orderCounter=0;


  Future getUserinfo(String order,String num,int price,String note,String time) async{
    await FirebaseFirestore.instance.collection('Orders').add({
      'order':order,
      'orderid':orderCounter.toString(),
      'price':price,
      'note':note,
      'Time':time,

    });

    print('hassan');

  }


  @override
  void dispose(){
  note1.dispose();
    super.dispose();
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
            Center(child: Text('Order',style: GoogleFonts.goldman(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white ),),),
          ],
        ),


      ),
    body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:NetworkImage('https://i.imgur.com/4JSZclv.jpg'),
              fit: BoxFit.cover
          )
      ),
      child: Column(children: [
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(22),
           color:  Color(0xFFFBC02D),
         ),
         width: 650,
         height: 655,

         child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),
             color:  Colors.black,
           ),
           width: 560,
           height: 630,

           child: Column(
             children: [
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.fromLTRB(0,0,400,20),
                 child: Container(
                     height: 110,
                     width: 390
                     ,child: Image.network("https://i.imgur.com/kNksgmP.gif",fit: BoxFit.fitWidth,width: 200,)),
               ),
               SizedBox(height: 10,),

                  Text("Order No.17"+"",style: TextStyle( color:  Color(0xFFFBC02D),fontSize: 23)),
             Text(widget.order+"",style: TextStyle( color:  Color(0xFFFBC02D),
               ),),
              // SizedBox(height: 5,),
               Text("Total Amount                           "+widget.price.toString()+" LE ",
               style: TextStyle(           color:  Color(0xFFFBC02D),
                   fontWeight: FontWeight.bold,fontSize: 33),),
               SizedBox(height: 10,),
               Padding(
                 padding: EdgeInsets.only(left: 100,right: 100),
                 child: TextFormField(
                   controller: note1,
                   style: TextStyle( color:  Color(0xFFFBC02D), fontSize: 20),
                   onChanged: (value){
                     note=value;

                   },
                   decoration: InputDecoration(
                     hintText: "Note",
                     hintStyle: TextStyle(color:Color(0xFFFBC02D) ),
                     border:InputBorder.none ,
                     enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(width: 3, color: Color(0xFFFBC02D))
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 3, color: Colors.white),
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 13,),

               Padding(
                 padding: EdgeInsets.only(left: 50,right: 410),
                 child: TextFormField(
                   style: TextStyle( color:  Color(0xFFFBC02D), fontSize: 20),
                   onChanged: (value){
                     mabla8=value;

                   },
                   decoration: InputDecoration(
                     hintText: "paid up",
                     hintStyle: TextStyle(color:Color(0xFFFBC02D) ),
                     border:InputBorder.none ,
                     enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(width: 3, color: Color(0xFFFBC02D))
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 3, color: Colors.white),
                     ),
                   ),
                 ),
               ),
               SizedBox(width: 20,),

                 Row(
                   children: [
                     SizedBox(width: 40,),
                     TextButton(onPressed: (){
                       setState(() {
                         theamount=int.parse(mabla8)-widget.price;
                         print(mabla8);
                       });
                     }, child:Text("pay",style: TextStyle(           color:  Color(0xFFFBC02D),
                     ),)),
                     SizedBox(width: 80,),
                     Text("$theamount",style: TextStyle(           color:  Color(0xFFFBC02D),
                     ),)
                   ],
                 ),

               SizedBox(height: 10,),
               Row(
                 children: [
                   SizedBox(width: 190,),
                   GestureDetector(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder:
                             (contxet)=> Home_Screen()));
                       },
                       child: Icon(CupertinoIcons.clear_circled,color: Color(0xFFFBC02D),size: 40,)),
                   SizedBox(width: 150,),
                   GestureDetector(
                       onTap: (){
                         setState(() {
                        getUserinfo(widget.order, orderCounter.toString(), widget.price, note1.text.trim(), current_date.toString());
                        orderCounter++;
                        print(orderCounter);
                         });
                         Navigator.push(context,MaterialPageRoute(builder:
                             (contxet)=> PrintScreen(title: "", order: widget.order,price: widget.price ,)));


                       },
                       child: Icon(CupertinoIcons.check_mark_circled,        color: Color(0xFFFBC02D),size: 40,)),
                 ],
               ),

             ],
           ),
         ),
       )
        ],)
        ],),
    ),
    );
  }
}
