//
// import 'package:flutter/material.dart';
// import 'package:hunar_seller/authenticate/login.dart';
// import 'package:hunar_seller/models/user.dart';
// import 'package:hunar_seller/screens/dashboard/dashboard.dart';
// import 'package:hunar_seller/screens/manager.dart';
// //import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hunar_seller/services/auth.dart';
//
// class Authenticate extends StatelessWidget {
//   final AuthService _auth = AuthService();
//   var uid;
//   void initState() {
//     getUser();
//     //super.initState();
//   }
//
//   void getUser()async{
//     dynamic result =  await _auth.getUser();
//     print(result.uid);
//     uid=result.uid;
//
//   }
//   @override
//
//   Widget build(BuildContext context) {
//    // final user = Provider.of<User>(context);
//     // return either the Home or Authenticate widget
//
//     if (uid == null){
//       return LoginScreen();
//     } else {
//       return Dashboard();
//     }
//   }
// }
