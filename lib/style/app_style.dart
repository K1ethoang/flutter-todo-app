import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bg1Color = const Color(0xFF313642);
  static Color cardColor = const Color(0xFF3E4553);
  static Color cardDoneColor = const Color(0xFF727272);
  static Color orangeColor = const Color(0xFFFF6E31);
  static Color greyColor = const Color(0xFFE4E4E4);
  static Color blackColor = const Color(0xFF000000);

  // cài đặt cho chữ
  static TextStyle appBarTitle = GoogleFonts.roboto(fontSize: 22.0);

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 16.0, color: greyColor);

  static TextStyle mainTitleDone = GoogleFonts.roboto(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: greyColor.withOpacity(0.4),
      decoration: TextDecoration.lineThrough);

  static TextStyle mainContent = GoogleFonts.nunito(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: greyColor);

  static TextStyle dateTitle = GoogleFonts.roboto(
      fontSize: 13.0, fontWeight: FontWeight.w500, color: greyColor);
}
