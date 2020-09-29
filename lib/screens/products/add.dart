

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hunar_seller/screens/products/add2.dart';
import 'package:hunar_seller/services/auth.dart';
import 'package:image_picker/image_picker.dart';
class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AuthService _auth = AuthService();
  var uid;
  File _image;
  String _uploadedFileURL;

  Future chooseFile() async {
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
    uploadFile();
  }

  Future uploadFile() async {
    uid = await _auth.getUser();
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
    //.child('test/$uid/${Path.basename(_image.path)}}');
        .child('test/profile/$uid');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  void initState() {
    getUser();
    print('Getting user');
    super.initState();
  }

  void getUser() async {
    uid = await _auth.getUser();
    print(uid);
  }

  final formKey = new GlobalKey<FormState>();
  String productName, productPrice;

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
                  padding: EdgeInsets.only(
                      left: 5, right: 0, top: 50, bottom: 50),
                  child: Text(
                    'Add New Product ',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  )
              ),

              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.productName = val;
                      });
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: 'Product Price per Unit',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.productPrice = val;
                      });
                    },
                  )),

              SizedBox(height: 20,),
              Column(

                children: [
                  // Text('Selected Image'),
                  // _image != null
                  //     ? Image.asset(
                  //   _image.path,
                  //   height: 150,
                  // )
                  //     : Container(height: 150),
                  _image == null
                      ? RaisedButton(
                    child: Text('Upload Product Picture'),
                    onPressed: chooseFile,
                    color: Colors.cyan,
                  )
                      : Container(),
                  // _image != null
                  //     ? RaisedButton(
                  //   child: Text('Upload File'),
                  //   onPressed: uploadFile,
                  //   color: Colors.cyan,
                  // )
                  //     : Container(),
                  _image != null
                      ? RaisedButton(
                    child: Text('Select Another?'),
                    onPressed: () {
                      chooseFile();
                      // setState(() {
                      //   _image = null;
                      // });
                    },
                  )
                      : Container(),
                  Text('Uploaded Image'),
                  _uploadedFileURL != null
                      ? CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      _uploadedFileURL,

                    ),
                  )
                      : Container(),
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: RaisedButton(
                        color: Colors.blue[200],
                        child: Center(
                          child: Text('Next', style: TextStyle(
                              color: Colors.white, letterSpacing: 4),
                          ),
                        ),
                        onPressed: () {
                          Map<String, dynamic> testData = {

                            'userID': uid,
                            'productName': productName,
                            'productPrice': productPrice,
                            'productURL': _uploadedFileURL,
                          };
                          // ignore: deprecated_member_use
                          CollectionReference collectionReference = Firestore
                              .instance.collection('testProduct');
                          // ignore: deprecated_member_use
                          // only use set data for inserting the first time
                          collectionReference.doc(uid).set(testData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProduct2()),
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