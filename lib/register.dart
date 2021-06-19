import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/home.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:phone_auth_project/otp.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  TextEditingController _usernameTextEditingcontroller =
      TextEditingController();
  TextEditingController _EmailTextEditingcontroller = TextEditingController();
  TextEditingController _AddresslTextEditingcontroller =
      TextEditingController();

  signMeUP() {
    if (formKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 1000.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return "Please provide with the first name";
                            },
                            controller: _usernameTextEditingcontroller,
                            decoration:
                                InputDecoration(hintText: "         Username"),
                          ),
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Please provide correct email";
                            },
                            controller: _EmailTextEditingcontroller,
                            decoration:
                                InputDecoration(hintText: "         Email"),
                          ),
                          TextFormField(
                            controller: _AddresslTextEditingcontroller,
                            decoration:
                                InputDecoration(hintText: "         Address"),
                          ),
                          TextFormField(
                            validator: (val) {
                              return val.length < 10
                                  ? null
                                  : "please provide correct number";
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text('+91'),
                              ),
                            ),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _controller,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            GestureDetector(
              onTap: () {
                signMeUP();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTPScreen(_controller.text)));
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
