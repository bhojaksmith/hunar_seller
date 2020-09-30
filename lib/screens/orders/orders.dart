import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hunar_seller/shared/appnav.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#f1f1f1'),
      body: SafeArea(

        child: Stack(


          children: [
            AppNav(),
          ],
        ),
      ),
    );
  }
}
