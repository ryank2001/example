import 'dart:developer';
import 'package:intro_slider_example/intro_screen_custom_config.dart';
import 'package:flutter/material.dart';

class chapter_select extends StatefulWidget {
  const chapter_select({Key? key, required this.name});
  final String name;
  @override
  chapter_select_state createState() => chapter_select_state();
}

// ------------------ Custom config ------------------
class chapter_select_state extends State<chapter_select> {

List<Widget> widgetlist(){
  List<Widget> list = [];
  for (int i = 1; i <= 62; i++) {
    list.add(
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  IntroScreenCustomConfig(anime_name: widget.name, chapter_number: i,)),
          );
        },
        child: Text('Chapter $i'),
      ),
    );
  }
  return list;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: widgetlist(),
          ),
        ),
      ),
    );
  }
}
