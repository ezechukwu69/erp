import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final FirebaseFirestore fb = FirebaseFirestore.instance;
const Color scaffoldColor = Color(0xFFfbd46d);
final TextStyle textStyle1 = GoogleFonts.aBeeZee();
Size getMedia(BuildContext context) {
  return MediaQuery.of(context).size;
}