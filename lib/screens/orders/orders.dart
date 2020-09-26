import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text("Orders", textAlign: TextAlign.center,style: TextStyle(color: Colors.lightBlue[200], fontSize: 32),),

            ],
          ),
        ),
    );
  }
}
