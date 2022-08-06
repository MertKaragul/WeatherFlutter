import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


String API_KEY = ""
    "";

var dateTime = new DateTime.now();
var formatDate = DateFormat("dd,yyyy").format(dateTime);


Text normalText(String text , double fontSize) {
  return Text(text , style: GoogleFonts.openSans(fontSize: fontSize),);
}