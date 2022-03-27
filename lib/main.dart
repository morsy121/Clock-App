import 'package:clockapp/screens/layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          splashColor: Colors.teal,
          //primaryColor: Colors.teal,
          colorScheme:
              ColorScheme.light(background: Colors.teal, primary: Colors.teal)),
      home: HomeLayout(),
    );
  }
}
