import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylist/verify.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125),
        child: AppBar(
          backgroundColor: Colors.blueAccent.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          elevation: 0.5,
          title: Container(
            child: Text(
              'My Daily Activities : ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          flexibleSpace: Positioned(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Login.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 25,
          right: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      hintText: "Email.",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      fillColor: Colors.blue.shade50,
                      filled: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      hintText: "Password.",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      fillColor: Colors.blue.shade50,
                      filled: true,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    color: Colors.blueAccent.shade400,
                    onPressed: () {
                      auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Get.offAll(
                          VerifyPage(),
                          transition: Transition.fadeIn,
                        );
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
