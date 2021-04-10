import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylist/verify.dart';

class DailyPage extends StatefulWidget {
  DailyPage({Key key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
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
                'My Daily Activities',
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
                  '',
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
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.text_fields_rounded),
                        hintText: "Your Activities.",
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
                    ),
                  ),
                ],
              ),
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
                      horizontal: 45,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Register',
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
                        VerifyPage(),
                        transition: Transition.fadeIn,
                      );
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
