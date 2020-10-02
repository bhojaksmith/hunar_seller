import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hunar_seller/screens/manager.dart';
import 'package:hunar_seller/screens/products/add.dart';
import 'package:hunar_seller/services/auth.dart';
import 'package:hunar_seller/shared/appnav.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
//import 'package:path/path.dart' as Path;
import 'dart:io';
class Products extends StatefulWidget {
  var productData;
  Products({this.productData});
  @override
  _ProductsState createState() => _ProductsState(productData:productData);
}

class _ProductsState extends State<Products> {
  Map productData;
  _ProductsState({this.productData});
  void initState(){
    getProducts();
    super.initState();
  }

  final TextEditingController eCtrl = new TextEditingController();
  final AuthService _auth = AuthService();
  var uid;
  File _image;
  var data;
  String _uploadedFileURL;
  Future chooseFile() async {
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    uid=await _auth.getUser();
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
   void getProducts() async {

     uid=await _auth.getUser();
     print('getting products $uid');
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
     firestoreInstance.collection("testSeller").get().then((querySnapshot) {
       querySnapshot.docs.forEach((result) {
         firestoreInstance
           .collection('testSeller')
             .doc(uid)
             .collection("products")
             .get()
             .then((querySnapshot) {
           querySnapshot.docs.forEach((result) {
             productData = result.data();
             print(productData);
           });
         });
       });
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#f1f1f1'),
      body:
        SafeArea(

         child: Stack(


          children: [
            AppNav(),

            Column(

              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Container(
                  height: 210,
                  margin: EdgeInsets.only(top:100,left:20,right: 20),
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(50),
                    child: Card(
                      child: ListView.builder(
                          padding: EdgeInsets.all(18.0),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            productData.forEach((key, value) {
                              print('kvp $key:$value');
                              ListTile(
                                  title: Text(''),
                                  onTap: () {},
                                  //trailing: Text(productData['productPrice']),
                              );

                            });
                            return new ListTile(
                              // title: Text(productData['productName']),
                              // onTap: () {},
                              // trailing: Text(productData['productPrice']),
                            );
                          }),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  margin: EdgeInsets.only(top:80,left:20),
                  child:Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                            elevation: 8,
                          color: Hexcolor('#ffffff'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Adding New.');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddProduct()),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  //padding: EdgeInsets.only(top:10,left:20),
                                    margin: EdgeInsets.only(top:10),
                                    width: 180,
                                    height: 50,
                                    child: Center(child: Text('Add Product',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),)),
                                  ),
                                Row(
                                  children: <Widget>[

                                      IconButton(

                                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                            icon: FaIcon(FontAwesomeIcons.plusCircle,size: 36,color: Colors.black,),

                                           // onPressed: () { print("Pressed"); }
                                        ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          elevation: 8,
                          color: Hexcolor('#ffffff'),
                          child: InkWell(

                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              getProducts();

                            },
                            child: Column(
                              children: [
                                Container(
                                  //padding: EdgeInsets.only(top:10,left:20),
                                  margin: EdgeInsets.only(top:10),
                                  width: 180,
                                  height: 50,
                                  child: Center(child: Text('Update Product',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900,),)),
                                ),
                                Row(
                                  children: <Widget>[

                                    IconButton(

                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.solidEdit,size: 36,color: Colors.black,),

                                        onPressed: () { getProducts(); }
                                    ),
                                  ],
                                ),
                              ],

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),

          ],

      ),

    ),

    );
  }
}
