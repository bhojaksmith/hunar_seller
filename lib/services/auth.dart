import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:hunar_seller/authenticate/register.dart';
//import 'package:hunar_seller/screens/dashboard/dashboard.dart';
import 'package:hunar_seller/authenticate/login.dart';
import 'package:hunar_seller/screens/manager.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
class AuthService extends StatelessWidget {
  void initState(){
    handleAuth();
    //super.initState();
  }
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            /*
            return Manager() if data in Sellers collection
            else Register()
            */
            print('user exists');
            return Manager();
          } else {
            print('Auth Failed');
            return LoginScreen();
          }
        });
  }
  //Get user data

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
  getUser()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    final User currentUser =  auth.currentUser;
    return currentUser.uid;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
