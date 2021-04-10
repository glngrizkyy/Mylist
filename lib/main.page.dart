import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylist/daily.page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            children: [Text('data')],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade400,
        onPressed: () {
          Get.offAll(
            DailyPage(),
            transition: Transition.fadeIn,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
