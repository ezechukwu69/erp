import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  final Function validate;
  SignInButton({Key key,this.validate}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: validate,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
          color: Colors.white,
          elevation: 16.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.amarante().copyWith(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_forward),
                )
              ])),
    );
  }
}
