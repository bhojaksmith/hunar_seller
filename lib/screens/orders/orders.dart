import 'package:flutter/material.dart';
import 'package:hunar_seller/shared/appnav.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
