import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopListViewItem extends StatefulWidget {
  final String value, status;
  final Color rgb;
  TopListViewItem(this.value, this.status, this.rgb);
  @override
  _TopListViewItemState createState() => _TopListViewItemState();
}

class _TopListViewItemState extends State<TopListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        decoration: BoxDecoration(
            color: widget.rgb,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.value,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 20)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.status,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
