//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hunar_seller/screens/dashboard/sellerprofile.dart';
//import 'package:hunar_seller/screens/manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hunar_seller/screens/dashboard/sidebar.dart';
import 'package:hunar_seller/services/auth.dart';

class Dashboard extends StatefulWidget {
  // ignore: deprecated_member_use
  final FirebaseUser user;
  Dashboard({this.user});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _auth = AuthService();
  var uid,collection='test';
  void initState(){
    getUser();
    print('Getting user');
    super.initState();
  }
  void getUser()async{
      uid=await _auth.getUser();
      print(uid);
      FirebaseFirestore.instance.collection(collection).doc(uid).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Document data: ${documentSnapshot.data()}');
          //data = documentSnapshot.data();
          data = documentSnapshot.data();
        } else {
          print('Document does not exist on the database');
        }
      });
  }
  Map data;

  @override
  Widget build(BuildContext context) {
    void _showUserProfile() {
      // Navigator.of(context).push(new MaterialPageRoute<Null>(
      //     builder: (BuildContext context) {
      //       return Container(
      //
      //               child: SellerProfile(data:data),
      //             );
      //     },
      //     fullscreenDialog: true
      // ));
      showModalBottomSheet(context: context, builder: (context){
        isScrollControlled:true;
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SellerProfile(data:data),
        );
      },
        isScrollControlled: true,
      );
    }
    void _showSideBar() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SideBar(),
        );
      });
    }
    return Scaffold(

      body: SafeArea(
        child: Stack(

          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[

                  Column(
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){
                          _showSideBar();
                        }, icon: Icon(Icons.menu,size: 36.0, color: Colors.grey[800],), label: Text(''),
                        //  color: Colors.amber[600],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "hunar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w100
                        ),
                      ),
                    ],

                  ),
                  Column(
                    children: <Widget>[
                      FlatButton.icon(onPressed: (){
                        _showUserProfile();
                      }, icon: Icon(Icons.person,size: 36.0, color: Colors.grey[800],), label: Text('')),
                    ],
                  ),


                  //Sign out process bug
                  // RaisedButton(
                  //   child: Text('Signout'),
                  //   onPressed: () {
                  //     AuthService().signOut();
                  //   },
                  // ),
                  //Text('${data["name"]}'?? null),
                ],

              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 130,
                  margin: EdgeInsets.only(top:80,left:10),
                  child:Row(
                    children: [
                      Card(

                        color: Hexcolor('#81D2FF'),
                        child: InkWell(

                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('orders tapped.');
                          },
                          child: Column(
                            children: [
                            Container(
                              padding: EdgeInsets.only(top:10,left:20),
                              width: 190,
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
                                  SizedBox(width: 30,),
                                  Text(
                                    '418',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),
                      Card(
                        color: Hexcolor('#FF8181'),
                        child: InkWell(

                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Customers tapped.');
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top:10,left:20),
                                width: 190,
                                height: 50,
                                child: Text('Customers',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,),),
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(

                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                      icon: FaIcon(FontAwesomeIcons.userPlus,size: 48,color: Colors.white,),

                                      onPressed: () { print("Pressed"); }
                                  ),
                                  SizedBox(width: 30,),
                                  Text(
                                    '36',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],

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
                      Card(
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
                                width: 190,
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
                                  Text(
                                    '34,000',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),
                      Card(
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
                                width: 190,
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
                                  SizedBox(width: 30,),
                                  Text(
                                    '416',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.white),textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],

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
