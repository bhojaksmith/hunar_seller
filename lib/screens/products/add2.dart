import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hunar_seller/authenticate/register3.dart';
import 'package:hunar_seller/screens/products/products.dart';
import 'package:hunar_seller/services/auth.dart';
class AddProduct2 extends StatefulWidget {
  @override
  _AddProduct2State createState() => _AddProduct2State();
}

class _AddProduct2State extends State<AddProduct2> {
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
  String productCategory='Food & Snacks',productDescription,productKeywords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 0,top:50,bottom: 5),
                    child: Text(
                      'Add Product Details',
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
                child: Text('Select Category '),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),

                child:DropdownButton<String>(
                  value: productCategory,

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
                      productCategory = newValue;
                    });
                  },
                  items: <String>['Food & Snacks', 'Puja & Saman', 'Art', 'Beauty & Health']
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
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:InputDecoration(
                      labelText: 'Product Description',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.productDescription = val;
                      });
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration:InputDecoration(
                      labelText: 'Product Keywords',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.productKeywords = val;
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
                            'productCategory': productCategory ,
                            'productDescription': productDescription ,
                            'productKeywords': productKeywords,
                          };
                          // ignore: deprecated_member_use
                          CollectionReference collectionReference = Firestore.instance.collection('testProduct');
                          // ignore: deprecated_member_use
                          // only use set data for inserting the first time
                          collectionReference.doc(uid).update(testData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Products()),
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
