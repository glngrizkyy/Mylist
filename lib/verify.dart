import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylist/daily.page.dart';
import 'package:mylist/loginregister.page.dart';
import 'package:mylist/main.page.dart';
import 'package:get/get.dart';
import 'package:mylist/model/entry.dart';
import 'package:mylist/providers/entry.provider.dart';
import 'package:provider/provider.dart';
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
    final entryProvider = Provider.of<EntryProvider>(context);
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
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Get.offAll(
                  LoginRegisterPage(),
                );
              },
            ),
          ],
          elevation: 0.5,
          title: Center(
            child: Container(
              margin: EdgeInsets.only(right: 20),
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
                  'Hi ${user.displayName} !',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Container(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    child: Icon(
                      Icons.edit,
                      // ignore: deprecated_member_use
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  title: Container(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
                    child: Text(
                      formatDate(
                        DateTime.parse(snapshot.data[index].date),
                        [MM, ' ', d, ', ', yyyy],
                      ),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DailyPage(
                              entry: snapshot.data[index],
                            )));
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          }),
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
      Navigator.maybeOf(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
