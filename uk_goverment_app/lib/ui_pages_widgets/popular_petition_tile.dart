import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularTile extends StatelessWidget {
  final String title, subtitle;

  PopularTile({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
          onTap: () {},
          title: Text(
            title,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.black)),
          ),
          subtitle: Text(subtitle,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15))),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 15,
          )),
    );
  }
}
