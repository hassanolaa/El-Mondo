import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_Screen.dart';
import 'Order_Screen.dart';

class Orders_page extends StatefulWidget {
  int? selectedIndex;

  int price=0;
  String order="";

  Orders_page({
    this.selectedIndex,
    required  this.order
  });

  @override
  State<Orders_page> createState() => _Orders_pageState();
}

class _Orders_pageState extends State<Orders_page> {
  int brugerCount=0;
  int kebdaCount=0;
  int sogo2Count=0;
  String price2="";
  DateTime current_date = DateTime.now();
  int orderCounter=100;

  @override
  Widget GridViewWidget(String name,String image,int price,String id,String time,String orderCount){
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
    SizedBox(height: 5,),
    Text("Order No.$orderCount",style: TextStyle( color:  Color(0xFFFBC02D),)),
      SizedBox(height: 5,),
    Text(
       time ,style: TextStyle(fontSize: 13,color: Color(0xFFFBC02D),),
      ),
      SizedBox(height: 5,),

      Text(
    name,style: TextStyle(fontSize: 13,color: Color(0xFFFBC02D),),
    ),
    SizedBox(height: 8,),
    //Text("Total Amount                           "+price.toString()+" LE \n",style: TextStyle(fontSize: 15,color: Color(0xFFFBC02D),),),

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
    onTap: ()async{
      setState(() {
        getUserinfo(name, "1", price,"",current_date.toString() );
      });
    await FirebaseFirestore.instance.collection("Orders").doc(id).delete();

    },
    child: Icon(CupertinoIcons.check_mark_circled,        color: Color(0xFFFBC02D),size: 35,)),
    ],
    ),

    ],
    ),
    ),


        ]
    );
  }
  Future getUserinfo(String order,String num,int price,String note,String time) async{
    await FirebaseFirestore.instance.collection('Confirmed').add({
      'order':order,
      'orderid':num,
      'price':price,
      'note':note,
      'ClassTime':time,

    });

    print('hassan');
  }
  Future getOrderCount() async{
    await FirebaseFirestore.instance.collection('orderCounter').add({
      'counter':orderCounter,


    });

    print('hassan');
  }
  @override
  void initState() {
    // TODO: implement initState
    getOrderCount();
    super.initState();
  }

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
            Center(child: Text('Orders',style: GoogleFonts.goldman(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white ),),),
          ],
        ),


      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
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
                      snapshot.data!.docs[index]['orderid'],






                    );
                  });
            }
            return Center(child:Text('something went wrong...',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30)) ,);

          } )
        ,


    );
  }
}
