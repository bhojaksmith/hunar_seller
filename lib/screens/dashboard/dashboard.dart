//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hunar_seller/screens/dashboard/sellerprofile.dart';
//import 'package:hunar_seller/screens/manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var uid;
  void initState(){
    getUser();
    print('Getting user');
    super.initState();
  }
  void getUser()async{
      uid=await _auth.getUser();
      print(uid);
  }
  Map data;

  @override
  Widget build(BuildContext context) {
    void _showUserProfile() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SellerProfile(),
        );
      });
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

                Container(
                    child: FlatButton.icon(
                        onPressed: (){}, icon: Icon(Icons.menu,size: 36.0, color: Colors.grey[800],), label: Text(''),
                    ),
                    margin: const EdgeInsets.only(left:10.0),
                   // color: Colors.amber[600],
                    //width: 48.0,

                    height: 48.0,
                ),
                Container(
                  child:  Text("hunar", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 35,fontWeight: FontWeight.w100),),
                  margin: const EdgeInsets.only(left:10.0),
                 // color: Colors.amber[600],
                  alignment: Alignment.center,
                  //width: 48.0,
                  height: 48.0,
                ),
                Container(
                  child: FlatButton.icon(onPressed: (){
                    _showUserProfile();
                  }, icon: Icon(Icons.person,size: 36.0, color: Colors.grey[800],), label: Text('')),
                  margin: const EdgeInsets.only(left:10.0),
                  //color: Colors.amber[600],
                  //width: 48.0,
                  height: 48.0,
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
      );

  }
}
