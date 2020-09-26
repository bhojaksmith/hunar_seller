
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hunar_seller/services/auth.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
//import "package:font_awesome_flutter_example/icons.dart";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
    );
  }
}