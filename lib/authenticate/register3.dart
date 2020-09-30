import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hunar_seller/screens/manager.dart';
import 'package:hunar_seller/services/auth.dart';
class Register3 extends StatefulWidget {
  @override
  _Register3State createState() => _Register3State();
}

class _Register3State extends State<Register3> {
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
  final formKey = new GlobalKey<FormState>();
  String sellerCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 100,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0,top: 10,bottom: 0),
                  child: Text('Welcome to ',
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight:FontWeight.w100,
                  ),),
                ),
              ),
              Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 0,top:0,bottom: 0),
                    child: Text(
                      'hunar',
                      style: TextStyle(
                        color: Colors.blue[200],
                        fontSize: 80,
                        fontWeight:FontWeight.w100,
                      ),
                    )
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child: RaisedButton(
                        color: Colors.blue[200],
                        child: Center(
                          child:Text('Lets Go !',style: TextStyle(color: Colors.white,letterSpacing: 4),
                          ),
                        ),
                        onPressed: () {
                          Map<String,dynamic> testData = {
                            'sellerCategories': sellerCategories ,
                          };
                          // ignore: deprecated_member_use
                          CollectionReference collectionReference = Firestore.instance.collection('testSeller');
                          // ignore: deprecated_member_use
                          // only use set data for inserting the first time
                          collectionReference.doc(uid).update(testData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Manager()),
                          );
                        }
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}
