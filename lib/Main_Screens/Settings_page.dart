import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings_page extends StatefulWidget {
  const Settings_page({Key? key}) : super(key: key);

  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
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
            Center(child: Text('statistics',style: GoogleFonts.goldman(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white ),),),
          ],
        ),


      ),
      body: Column(
        children: [

          Row(
            children: [
              Column(
                children: [
                  SizedBox(height: 5,),
                  Text("Orders per time",style: GoogleFonts.robotoSlab(fontSize: 20,color: Color(0xFFFBC02D)),),
                  SizedBox(height: 15,),

                  Container(
                    color:Color(0xFFFBC02D) ,
                    width: 400,
                    height: 300,
                    child: AspectRatio(aspectRatio: 1,
                    child: LineChart(LineChartData(
                       lineBarsData:[
                         LineChartBarData(
                           spots: const[
                             FlSpot(0, 3),
                             FlSpot(2, 6),
                             FlSpot(3, 7),
                             FlSpot(4, 1),
                             FlSpot(9, 3),

                           ],
                           isCurved: true,
                           dotData: FlDotData(show: true),
                           color: Colors.black,
                           barWidth: 5,
                           belowBarData: BarAreaData(

                           )
                         )
                       ],

                    )

                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 100,),
              Column(
                children: [
                  SizedBox(height: 5,),
                  Text("Most ordered category",style: GoogleFonts.robotoSlab(fontSize: 20,color: Color(0xFFFBC02D)),),
                  Container(
                    height: 300,
                     width: 400 ,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 5,
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 2,
                        sections: [
                          PieChartSectionData(
                            value: 35,color: Colors.orange,radius: 100,
                          ),
                          PieChartSectionData(
                            value: 20,color: Colors.amber,radius: 100,
                          ),  PieChartSectionData(
                            value: 10,color: Colors.yellowAccent,radius: 100,
                          ),  PieChartSectionData(
                            value: 35,color: Colors.yellow,radius: 100,
                          ),
                        ]
                      )
                    ),
                  ),
                  SizedBox(height: 5,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Most Orderd",style: TextStyle(color: Colors.orange),),
                                  SizedBox(width: 30,),
                                  Text("Sandwich",style: TextStyle(color: Colors.amber),),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("Drinks",style: TextStyle(color: Colors.yellowAccent),),
                                  SizedBox(width: 30,),
                                  Text("Main Meals",style: TextStyle(color: Colors.yellow),),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(width: 100,),
              Column(
                children: [
                  SizedBox(height: 5,),
                  Text("Orders per time",style: GoogleFonts.robotoSlab(fontSize: 20,color: Color(0xFFFBC02D)),),
                  SizedBox(height: 15,),
                  Container(
                    color: Color(0xFFFBC02D),
                    height: 300,
                    width: 400,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: BarChart(
                        BarChartData(
                          backgroundColor:Color(0xFFFBC02D) ,
                          borderData: FlBorderData(
                            border: Border(
                              top: BorderSide.none,
                              right: BorderSide.none,
                              left: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),

                            )
                          ),
                          groupsSpace: 10,
                          barGroups: [
                            BarChartGroupData(x: 1,barRods: [BarChartRodData(toY: 10,fromY: 0,width: 15,color: Colors.black)]),
                            BarChartGroupData(x: 2,barRods: [BarChartRodData(toY: 20,fromY: 0,width: 15,color: Colors.black)]),
                            BarChartGroupData(x: 3,barRods: [BarChartRodData(toY: 5,fromY: 0,width: 15,color:  Colors.black)]),
                            BarChartGroupData(x: 4,barRods: [BarChartRodData(toY: 30,fromY: 0,width: 15,color:  Colors.black)]),

                          ]
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
