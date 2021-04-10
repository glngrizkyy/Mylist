import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylist/loginregister.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mylist/providers/entry.provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginRegisterPage(),
      ),
    );
  }
}
