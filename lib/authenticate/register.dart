import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunar_seller/authenticate/register2.dart';
import 'package:hunar_seller/services/auth.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  String sellerName,sellerDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //     padding: EdgeInsets.only(left: 5, right: 0,top:50,bottom: 0),
              //     child: Text(
              //       'hunar',
              //       style: TextStyle(
              //         color: Colors.blue[200],
              //         fontSize: 80,
              //         fontWeight:FontWeight.w100,
              //       ),
              //     )
              // ),

              Padding(
                  padding: EdgeInsets.only(left: 5, right: 0,top:50,bottom: 50),
                  child: Text(
                    'Register Your Business ',
                    style: TextStyle(
                      fontSize: 32,
                      color:Colors.black,
                      fontWeight:FontWeight.w200,
                    ),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:InputDecoration(
                      labelText: 'Seller Name',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.sellerName = val;
                      });
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:InputDecoration(
                      labelText: 'Seller Description',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.sellerDescription = val;
                      });
                    },
                  )),

              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child: RaisedButton(
                        color: Colors.blue[200],
                        child: Center(
                          child:Text('Next',style: TextStyle(color: Colors.white,letterSpacing: 4),
                          ),
                        ),
                        onPressed: () {
                          Map<String,dynamic> testData = {
                            'sellerName': sellerName ,
                            'sellerDescription': sellerDescription ,
                          };
                          // ignore: deprecated_member_use
                          CollectionReference collectionReference = Firestore.instance.collection('test');
                          // ignore: deprecated_member_use
                          // only use set data for inserting the first time
                          collectionReference.doc(uid).set(testData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register2()),
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
