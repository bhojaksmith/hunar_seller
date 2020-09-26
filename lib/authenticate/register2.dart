import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunar_seller/authenticate/register3.dart';
import 'package:hunar_seller/services/auth.dart';
class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
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
  String sellerState='Gujarat',sellerCity='Ahmedabad',sellerAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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

              Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 0,top:50,bottom: 5),
                    child: Text(
                      'Register Your Business ',
                      style: TextStyle(
                        fontSize: 32,
                        color:Colors.black,
                        fontWeight:FontWeight.w200,
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,top: 10,bottom: 10),
                child: Text('Select State'),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),

                  child:DropdownButton<String>(
                    value: sellerState,

                    //icon: Icon(Icons.arrow_downward),
                    iconSize: 0,
                    elevation: 4,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        sellerState = newValue;
                      });
                    },
                    items: <String>['Gujarat', 'Maharastra', 'Madhyapradesh', 'Rajasthan']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  ),
              // have to change cities based on selected state later
              Padding(
                padding: const EdgeInsets.only(left: 25.0,top: 10,bottom: 10),
                child: Text('Select City'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),

                child:DropdownButton<String>(
                  value: sellerCity,

                  //icon: Icon(Icons.arrow_downward),
                  iconSize: 0,
                  elevation: 4,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      sellerCity = newValue;
                    });
                  },
                  items: <String>['Ahmedabad', 'Surat', 'Junagadh', 'Vadodra']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.sellerAddress = val;
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
                            'sellerCity': sellerCity ,
                            'sellerState': sellerState ,
                            'sellerAddress': sellerAddress,
                          };
                          // ignore: deprecated_member_use
                          CollectionReference collectionReference = Firestore.instance.collection('test');
                          // ignore: deprecated_member_use
                          // only use set data for inserting the first time
                          collectionReference.doc(uid).update(testData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register3()),
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
