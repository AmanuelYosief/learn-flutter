import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titles extends StatelessWidget {
  final String title;
  Titles(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}
