import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylist/login.page.dart';
import 'package:mylist/register.page.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({Key key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
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
          flexibleSpace: Positioned(
            child: Center(
              child: Container(
                child: Text(
                  'My Daily Activities',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 140,
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 45,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        color: Colors.blueAccent.shade400,
                        onPressed: () {
                          Get.to(
                            LoginPage(),
                            transition: Transition.fadeIn,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        color: Colors.blueAccent.shade400,
                        onPressed: () {
                          Get.to(
                            RegisterPage(),
                            transition: Transition.fadeIn,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
