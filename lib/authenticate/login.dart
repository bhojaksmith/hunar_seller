import 'package:firebase_auth/firebase_auth.dart';
import 'package:hunar_seller/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 5, right: 0,top:10,bottom: 0),
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 40,
                      color:Colors.grey,
                      fontWeight:FontWeight.w200,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5, right: 0,top:0,bottom: 50),
                  child: Text(
                    'Hunar',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight:FontWeight.bold,
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,

                    decoration:InputDecoration(
                      labelText: 'Phone number',
                     labelStyle: TextStyle(
                       color: Colors.grey,
                     ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.phoneNo = val;
                      });
                    },
                  )),
              codeSent ? Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter OTP',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        this.smsCode = val;
                      });
                    },
                  )) : Container(),
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child: RaisedButton(
                        color: Colors.blue[200],
                        child: Center(
                            child: codeSent ? Text('Submit OTP',style: TextStyle(color: Colors.white),):Text('LOGIN',style: TextStyle(color: Colors.white,letterSpacing: 8),
                            ),
                        ),
                        onPressed: () {
                          codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                        }
                    ),
                  )
              )
            ],
          )
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
