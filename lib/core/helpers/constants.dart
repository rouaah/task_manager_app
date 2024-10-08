import 'package:flutter/material.dart';

class Constants {

  static String getLanguageText(String locale) {
    switch (locale) {
      case "ar":
        return "Arabic";
      case "en":
        return "English";
      default:
        return '';
    }
  }

  static List images = [
    "https://cdn.i-scmp.com/sites/default/files/styles/landscape/public/d8/yp/images/shutterstock_594171068.jpg?itok=d2drmVY5",
    "https://www.cam.ac.uk/sites/www.cam.ac.uk/files/styles/content-885x432/public/news/research/news/glenn-carstens-peters-203007-unsplash.jpg?itok=BtmxhTcP",
    "https://wintechnology.com/wp-content/uploads/2022/11/Untitled-design-5-1080x627.png",
    "https://www.dinodata.org/wp-content/uploads/2019/12/dinodata-internettechnology-min.jpg",
  ];
  static List colors = const [
    Color.fromARGB(255, 201, 225, 255),
    Color.fromARGB(255, 235, 207, 239),
    Color.fromARGB(255, 255, 244, 178),
    Color.fromARGB(255, 214, 245, 206),
  ];

  static int listCount(bool isEnding, int listLength, {int initItems = 5}) {
    if (isEnding || listLength < initItems) {
      return listLength;
    } else {
      // + 1 for the loading indicator
      return listLength + 1;
    }
  }

  static String authenticationKey = 'sak_tSkA3gt70xkw4l27vqfb==';

  static String printDuration(Duration? duration) {
    if (duration == null) return '00:00';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
