import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hunar_seller/services/auth.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  AuthService _auth =AuthService();
  Map data={};
  var uid;
  void initState(){
    getUser();
    getSellerProfile();
    print('Getting user');
    super.initState();
  }
  void getUser()async{
    uid=await _auth.getUser();
    print(uid);
  }
  void getSellerProfile()async{
    //FirebaseFirestore firestore = FirebaseFirestore.instance;

    FirebaseFirestore.instance.collection('users').doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

         child:Center(
           child: Column(
             children: <Widget>[
                  CircleAvatar(
                    radius:45,

                  ),
                   SizedBox(height: 20,),
                   Text(
                    '${data["name"]}',
                        style: TextStyle(fontSize: 32),
                   )
             ],
           ),
         ),
      ),
    );
  }
}
