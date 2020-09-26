import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hunar_seller/authenticate/register.dart';
import 'package:hunar_seller/screens/dashboard/dashboard.dart';
import 'package:hunar_seller/screens/products/products.dart';
import 'package:hunar_seller/screens/orders/orders.dart';
import 'package:hunar_seller/services/auth.dart';
//import 'package:hunar_seller/shared/loading.dart';
class Manager extends StatefulWidget {
  final User user;
  Manager({this.user});
  @override
  _ManagerState createState() => _ManagerState();

}

class _ManagerState extends State<Manager> {
  final AuthService _auth = AuthService();
  var uid;
  void initState(){
    getUser();
    print('Getting user');
    super.initState();
  }
  void getUser()async{
    uid=await _auth.getUser();
    print(uid);
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Product',
      style: optionStyle,
    ),
    Text(
      'Index 2: Orders',
      style: optionStyle,
    ),
  ];

  //Object get getuser => ;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final tabs = <Widget>[
    Dashboard(),
    Products(),
    Orders(),
  ];

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder (
        stream: FirebaseFirestore.instance.collection('test').doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {

            return Register();
            //print('no data');
          }
          print('we have data');
          return Scaffold(

            body: tabs[_selectedIndex],

            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Dashboard'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inbox),
                  title: Text('Products'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Orders'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue[200],
              onTap: _onItemTapped,
            ),
          );
        }
    );

  }
}



