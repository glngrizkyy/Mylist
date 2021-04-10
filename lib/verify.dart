import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylist/daily.page.dart';
import 'package:mylist/main.page.dart';
import 'package:get/get.dart';
// import 'package:mylist/daily.page.dart';

class VerifyPage extends StatefulWidget {
  VerifyPage({Key key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    super.initState();
  }

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
          title: Center(
            child: Container(
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
          ),
          flexibleSpace: Positioned(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Home',
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
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  right: 80,
                ),
                child: Text(
                  'HI ${user.email} !',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  right: 165,
                ),
                child: Text(
                  'Activity Done.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade400,
        onPressed: () {
          Get.to(
            DailyPage(),
            transition: Transition.fadeIn,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> checkEmailVerifiend() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
