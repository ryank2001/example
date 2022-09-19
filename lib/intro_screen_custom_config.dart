import 'dart:developer';
import 'package:fullscreen/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:http/http.dart' as http;

class IntroScreenCustomConfig extends StatefulWidget {
  IntroScreenCustomConfig(
      {Key? key, required this.anime_name, required this.chapter_number})
      : super(key: key);
  final String anime_name;
  final int chapter_number;
  @override
  IntroScreenCustomConfigState createState() => IntroScreenCustomConfigState();
}

// ------------------ Custom config ------------------
class IntroScreenCustomConfigState extends State<IntroScreenCustomConfig> {
  List<Slide> slides = [];
  var loading = true;
  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() async {
    setState(() {
      loading = true;
    });

    await loadpages();
   
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _exit();
    super.dispose();
  }

  void _exit() async {
    await FullScreen.exitFullScreen();
  }

  Future<bool> loadpages() async {
    int pages = 1;
    bool isLast = false;
    while (isLast == false) {
      String url =
          "http://images.mangafreak.net/mangas/${widget.anime_name}/${widget.anime_name}_${widget.chapter_number}/${widget.anime_name}_${widget.chapter_number}_$pages.jpg";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        slides.add(
          Slide(
            backgroundNetworkImage: url,
            backgroundImageFit: BoxFit.scaleDown,
          ),
        );
        pages++;
      } else {
        isLast = true;
      }
    }
    return true;
  }

  void onDonePress() {
    // Do what you want
    Navigator.pop(context);
  }

  void onNextPress() {
    log("onNextPress caught");
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
        return InteractiveViewer(child: IntroSlider(
          // List slides
          slides: slides,
          showSkipBtn: false,
          showPrevBtn: false,
          showDotIndicator: false,
          showNextBtn: false,
          onDonePress: onDonePress,
          curveScroll: Curves.bounceIn,
        ));
        
    }
  }
}
