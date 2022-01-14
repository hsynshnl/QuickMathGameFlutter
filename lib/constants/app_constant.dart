import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_math_game/constants/app_strings.dart';

class Sabitler {
  static const mainbackgroundColor = Color(0xff232323);
  static const mainAppBarBackgroundColor = Color(0xff232323);

  static const appBarTitle = Center(child: Text(Strings.appName));

  static TextStyle mainListTitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
  );
  static TextStyle mainListCircleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
        fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
  );
  static const plusGameColor = Color(0xffA5AAA3);
  static const plusGameShape = RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0x0ff7dbbb),
      width: 5,
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static const minusGameColor = Color(0xff812F33);
  static const minusGameShape = RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0x0ff7dbbb),
      width: 5,
    ),
  );

  static const divideGameColor = Color(0xff705E78);
  static const divideGameShape = RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0x0ff7dbbb),
      width: 5,
    ),
  );

  static const multiplyGameColor = Color(0xff45848f);
  static const multiplyGameShape = RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0x0ff7dbbb),
      width: 5,
    ),
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
  );

  static createListTile(int color, String title, String gameOperator) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(color),
        child: Center(
          child: Text(
            gameOperator,
            style: Sabitler.mainListCircleTextStyle,
          ),
        ),
      ),
      title: Text(
        title,
        style: Sabitler.mainListTitleTextStyle,
      ),
    );
  }

  static TextStyle difficultyTextStyle = GoogleFonts.openSans(
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  static buttonStyle(Color color) {
    return ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(200, 75)),
        backgroundColor: MaterialStateProperty.all<Color>(color));
  }
}
