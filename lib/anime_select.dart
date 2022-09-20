

import 'package:intro_slider_example/chapter_select.dart';

import 'package:flutter/material.dart';

class anime_select extends StatefulWidget {
  const anime_select({Key? key}) : super(key: key);

  @override
  anime_select_state createState() => anime_select_state();
}

// ------------------ Custom config ------------------
class anime_select_state extends State<anime_select> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Select'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chapter_select(name: "spy_x_family",)),
                  );
                },
                child: const Text('spy_x_family'),
              ),
              
            ],
          ),
        ),
        ),
      
    );
   
  }
}

