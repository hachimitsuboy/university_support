import 'package:flutter/material.dart';
import 'package:university_support/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "university_support",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.greenAccent,
          ),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white70,
        ),
        iconTheme: IconThemeData(
          color: Colors.white70,
        ),
      ),
      //TODO
      home: HomeScreen(),
    );
  }
}
