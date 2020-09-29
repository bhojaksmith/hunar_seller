import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'package:hunar_seller/authenticate/register.dart';
import 'package:hunar_seller/screens/dashboard/sellerprofile.dart';
import 'package:hunar_seller/screens/dashboard/sidebar.dart';
import 'package:hunar_seller/services/auth.dart';

class AppNav extends StatefulWidget {
  @override
  _AppNavState createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {

  Map data;

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
        return Register();
      }
    });
  }

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

  @override

  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

}
