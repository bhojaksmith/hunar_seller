import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text("Products", textAlign: TextAlign.center,style: TextStyle(color: Colors.lightBlue[200], fontSize: 32),),

            ],
          ),
        ),
    );
  }
}
