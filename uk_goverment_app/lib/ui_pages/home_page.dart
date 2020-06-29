import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uk_goverment_app/styles/MyColor.dart';
import 'package:uk_goverment_app/ui_pages_widgets/titles.dart';
import 'package:uk_goverment_app/ui_pages_widgets/top_listview.dart';
import 'package:uk_goverment_app/ui_pages_widgets/vertical_listView.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().light,
      appBar: AppBar(
        backgroundColor: MyColor().light,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColor().black),
        centerTitle: true,
        title: Text(
          ('UK Petitions'),
          style:
              GoogleFonts.poppins(textStyle: TextStyle(color: MyColor().black)),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: MyColor().black,
              ),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                children: [
                  buildView(),
                  SizedBox(height: 10),
                  Titles('Top petitions'),
                  SizedBox(height: 10),
                  VerticalListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildView() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopListViewItem(
                '1,929', 'Open petitions', Color.fromRGBO(233, 233, 233, 0.6)),
            SizedBox(
              width: 10,
            ),
            TopListViewItem(
                '77', 'Responses', Color.fromRGBO(233, 233, 233, 0.6)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopListViewItem(
                '32', 'Awaiting response', Color.fromRGBO(233, 233, 233, 0.6)),
            SizedBox(
              width: 10,
            ),
            TopListViewItem(
                '22', 'Awaiting debate', Color.fromRGBO(233, 233, 233, 0.6)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopListViewItem(
                '6', 'Recently debated', Color.fromRGBO(233, 233, 233, 0.6)),
            SizedBox(
              width: 10,
            ),
            TopListViewItem('1', 'Recently not debated',
                Color.fromRGBO(233, 233, 233, 0.6)),
          ],
        ),
      ],
    ),
  );
}
