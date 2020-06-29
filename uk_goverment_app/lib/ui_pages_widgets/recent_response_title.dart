import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentResponseTitle extends StatelessWidget {
  final String title, subtitle;
  RecentResponseTitle({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title,
          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15))),
      subtitle: Text(this.subtitle,
          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15)), maxLines: 2,),
          isThreeLine: true,
    );
  }
}
