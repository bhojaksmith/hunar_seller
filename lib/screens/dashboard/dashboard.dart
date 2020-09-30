//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bezier_chart/bezier_chart.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:hunar_seller/authenticate/register.dart';
//import 'package:hunar_seller/screens/dashboard/sellerprofile.dart';
//import 'package:hunar_seller/screens/manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hunar_seller/screens/manager.dart';
//import 'package:hunar_seller/screens/dashboard/sidebar.dart';
//import 'package:hunar_seller/services/auth.dart';
import 'package:hunar_seller/shared/appnav.dart';

class Dashboard extends StatefulWidget {
  // ignore: deprecated_member_use
  final FirebaseUser user;
  Dashboard({this.user});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    var graphColor= '81FFBB';

    return Scaffold(
      backgroundColor: Hexcolor('#f1f1f1'),
      body: SafeArea(

        child: Stack(


          children: [
            AppNav(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 130,
                  margin: EdgeInsets.only(top:80,left:10),
                  child:Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Card(

                          color: Hexcolor('#81D2FF'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('orders tapped.');
                             setState(() {
                               graphColor = "#81D2FF";
                               print('$graphColor');
                             });
                            },
                            child: Column(
                              children: [
                              Container(
                                padding: EdgeInsets.only(top:10,left:20),
                                width: 180,
                                height: 50,
                                child: Text('Orders',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,),),
                              ),
                                Row(
                                  children: <Widget>[
                                    IconButton(

                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.shoppingBasket,size: 48,color: Colors.white,),

                                        onPressed: () { print("Pressed"); }
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0,top: 18),
                                      child: Text(
                                        '418',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      child: IconButton(

                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                          icon: FaIcon(FontAwesomeIcons.arrowUp,size: 14,color: Colors.white,),
                                         // onPressed: () { print("Pressed"); }
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 12.0,),
                                      child: Text(
                                        '20',style: TextStyle(fontSize: 14,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Card(

                          color: Hexcolor('#FF8181'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Customers tapped.');
                              setState(() {
                                graphColor = "#FF8181";
                                print('$graphColor');
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:10,left:20),
                                  width: 180,
                                  height: 50,
                                  child: Text('Customers',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,),),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(

                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.userPlus,size: 48,color: Colors.white,),

                                      //  onPressed: () { print("Pressed"); }
                                    ),
                                    SizedBox(width: 30,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:0.0,top: 18),
                                      child: Text(
                                        '36',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      child: IconButton(

                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                          icon: FaIcon(FontAwesomeIcons.arrowUp,size: 14,color: Colors.white,),
                                       //   onPressed: () { print("Pressed"); }
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 12.0,),
                                      child: Text(
                                        '14',style: TextStyle(fontSize: 14,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 130,
                  margin: EdgeInsets.only(top:10,left:10),
                  child:Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Card(

                          color: Hexcolor('#81FFBB'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Revenue tapped.');
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top:10,left:20),
                                  width: 180,
                                  height: 50,
                                  child: Text('Revenue',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,),),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(

                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.cashRegister,size: 48,color: Colors.white,),

                                        onPressed: () { print("Pressed"); }
                                    ),
                                    SizedBox(width: 30,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20.0),
                                      child: Text(
                                        '34,000',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Card(

                          color: Hexcolor('#FFC581'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Deliveries tapped.');
                            },
                            child: Column(

                              children: [
                                Container(

                                  padding: EdgeInsets.only(top:10,left:20),
                                  width: 180,
                                  height: 50,
                                  child: Text('Deliveries',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,),),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(

                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.shippingFast,size: 48,color: Colors.white,),

                                        onPressed: () { print("Pressed"); }
                                    ),
                                    SizedBox(width: 45,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20.0),
                                      child: Text(
                                        '416',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Revenue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Center(
                        child: Card(
                          elevation:8,

                          child: Container(

                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: BezierChart(

                                bezierChartScale: BezierChartScale.CUSTOM,
                                selectedValue: 30,

                                xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                                footerValueBuilder: (double value) {
                                  return "${formatAsIntOrDouble(value)}\ndays";
                                },
                                series: const [
                                  BezierLine(

                                    lineColor: Colors.white,
                                    label: "m",
                                    data: const [
                                      DataPoint<double>(value: 10, xAxis: 0),
                                      DataPoint<double>(value: 130, xAxis: 5),
                                      DataPoint<double>(value: 50, xAxis: 10),
                                      DataPoint<double>(value: 150, xAxis: 15),
                                      DataPoint<double>(value: 75, xAxis: 20),
                                      DataPoint<double>(value: 0, xAxis: 25),
                                      DataPoint<double>(value: 5, xAxis: 30),
                                      DataPoint<double>(value: 45, xAxis: 35),
                                    ],
                                  ),
                                ],
                                config: BezierChartConfig(
                                  xLinesColor:Colors.black,
                                  updatePositionOnTap:true,
                                  startYAxisFromNonZeroValue: false,
                                  bubbleIndicatorColor: Hexcolor('f1f1f1'),
                                  bubbleIndicatorLabelStyle:TextStyle(color:Colors.black),
                                  bubbleIndicatorTitleStyle:TextStyle(color:Colors.black),
                                  footerHeight: 40,
                                  // verticalIndicatorStrokeWidth: 3.0,
                                  // verticalIndicatorColor: Colors.black,
                                  showVerticalIndicator: false,
                                  verticalIndicatorFixedPosition: false,
                                  displayYAxis: true,
                                  stepsYAxis: 50,
                                  backgroundColor: Hexcolor('$graphColor'),
                                  // backgroundGradient: LinearGradient(
                                  //   colors: [
                                  //     Colors.blue[300],
                                  //     Colors.blue[400],
                                  //     Colors.blue[400],
                                  //     Colors.blue[500],
                                  //     Colors.blue,
                                  //   ],
                                  //   begin: Alignment.topCenter,
                                  //   end: Alignment.bottomCenter,
                                  // ),
                                  snap: true,
                                ),
                              ),
                            ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      );
  }
}
