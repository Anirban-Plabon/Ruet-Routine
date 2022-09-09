import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/screens/addroutine.dart';
import 'package:routine/screens/availableclasses.dart';
import 'package:routine/screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Routine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddRoutine(),
    );
  }
}
