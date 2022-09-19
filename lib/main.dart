import 'package:flutter/material.dart';


import 'package:intro_slider_example/anime_select.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: anime_select(),
      
      debugShowCheckedModeBanner: false,
    );
  }
}
