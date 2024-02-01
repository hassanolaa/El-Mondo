import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Screen.dart';

class History_page extends StatefulWidget {
  const History_page({Key? key}) : super(key: key);

  @override
  State<History_page> createState() => _History_pageState();
}

class _History_pageState extends State<History_page> {
  Widget GridViewWidget(String name,String image,int price,String id,String time){
    return   GridView.count(
        crossAxisCount: 1,

        children:[

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFFBC02D)),

              color: Colors.black,
            ),
            height: 280,
            width: 400,

            child: Column(
              children: [
                SizedBox(height: 8,),
                Text(
                  "Order :",style: TextStyle(fontSize: 20,color: Color(0xFFFBC02D),),
                ),
                SizedBox(height: 10,),
                Text(
                  time ,style: TextStyle(fontSize: 13,color: Color(0xFFFBC02D),),
                ),
                SizedBox(height: 5,),
                Text(
                  name,style: TextStyle(fontSize: 13,color: Color(0xFFFBC02D),),
                ),
                SizedBox(height: 8,),
                Text("Total Amount                           "+price.toString()+" LE \n",style: TextStyle(fontSize: 15,color: Color(0xFFFBC02D),),),



              ],
            ),
          ),


        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFFBC02D),   Color(0xFFFBC02D)],begin:Alignment.centerLeft,end: Alignment.centerRight )),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 50,),
            Center(child: Text('History',style: GoogleFonts.goldman(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white ),),),
          ],
        ),


      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Confirmed').snapshots(),
          builder:(context,AsyncSnapshot snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.red,),);
            }
            else if (snapshot.connectionState==ConnectionState.active){
              return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4
                  ),
                  itemBuilder: (BuildContext context,int index){
                    return GridViewWidget(
                      snapshot.data!.docs[index]['order'],
                      snapshot.data!.docs[index]['orderid'],
                      snapshot.data!.docs[index]['price'],
                      snapshot.data!.docs[index].id,
                      snapshot.data!.docs[index]['Time'],





                    );
                  });
            }
            return Center(child:Text('something went wrong...',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30)) ,);

          } ),
    );
  }
}
