//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:hunar_seller/services/auth.dart';

class SellerProfile extends StatefulWidget {
  final Map data;

  SellerProfile({this.data});
  @override
  _SellerProfileState createState() => _SellerProfileState(data:data);
}

class _SellerProfileState extends State<SellerProfile> {

  final Map data;
  _SellerProfileState({this.data});




  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(

         child:Center(
           child: Column(
             children: <Widget>[
                  SizedBox(height: 20,),
                  CircleAvatar(
                    radius:45,

                  ),
                   SizedBox(height: 20,),

                   Text(
                    '${data["sellerName"]}',
                        style: TextStyle(fontSize: 32),
                   ),
                   SizedBox(height: 20,),
                   Text(
                     '${data["sellerCity"]}',
                     style: TextStyle(fontSize: 20),
                   )
                 ],
           ),
         ),
      ),
    );
  }
}
