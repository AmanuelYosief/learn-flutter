import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uk_goverment_app/ui_pages_widgets/popular_petition_tile.dart';
import 'package:uk_goverment_app/ui_pages_widgets/recent_response_title.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'UK Goverment and Parliament - Petitions ',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ),
              ),
            ),
            Expanded(flex: 1, child: headerContainer()),
            Expanded(flex: 2, child: _verticalListView()),
          ],
        ),
      ),
    );
  }

  Widget headerContainer() {
    return Stack(children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [],
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                _headerInfoGraph(),
                SizedBox(
                  height: 10,
                ),
                //_secondHorizonalView(),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  Widget smallWhiteSpace() => SizedBox(
        height: 10,
      );

  Widget mediumWhiteSpace() => SizedBox(
        height: 30,
      );

  Widget largeWhiteSpace() => SizedBox(
        height: 60,
      );

  Widget _floatingNavBar() {
    return FloatingNavbar(items: [
      FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
      FloatingNavbarItem(icon: Icons.settings, title: 'Setting'),
    ], currentIndex: 0, onTap: null);
  }

  Widget _headerInfoGraph() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            topListViewItem(
                '1,929', 'Open petitions', Color.fromRGBO(233, 233, 233, 0.6)),
            SizedBox(width: 10),
            topListViewItem(
                '77', 'Recent response', Color.fromRGBO(177, 118, 220, 0.15)),
            SizedBox(height: 10),
          ],
          //
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            topListViewItem(
                '32', 'Awaiting response', Color.fromRGBO(232, 245, 240, 1)),
            SizedBox(width: 10),
            topListViewItem(
                '22', 'Awaiting debate', Color.fromRGBO(243, 244, 191, 0.4)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            topListViewItem(
                '6', 'Debated', Color.fromRGBO(235, 195, 142, 0.20)),
            SizedBox(width: 10),
            topListViewItem(
                '1', 'Not debated', Color.fromRGBO(248, 155, 170, 0.25)),
          ],
        ),
      ],
    );
  }

  Widget topListViewItem(String value, String status, Color rgb) {
    return Container(
        width: 180,
        decoration: BoxDecoration(
            color: rgb, borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                            value,
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
                        status,
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

  Widget smallRowOption(value) {
    return Row(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15)),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _popularPetitions() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Trending petitions',
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }

  Widget _verticalListView() {
    return Column(
      children: [
        _popularPetitions(),
        Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              height: 100,
              child:
                  ListView(scrollDirection: Axis.vertical, children: <Widget>[
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Improve Maternal Mortality Rates and Health Care for Black Women in the U.K',
                    subtitle: '1,324 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title: 'Introduce Mandatory Ethnicity Pay Gap Reporting',
                    subtitle: '334 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Suspend future sales of tear gas and other crowd control equipment to the USA',
                    subtitle: '300 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Allow Salons and Tattoo parlors to open at same time as hairdressers',
                    subtitle: '272 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Allow Salons and Tattoo parlors to open at same time as hairdressers',
                    subtitle: '272 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Allow Salons and Tattoo parlors to open at same time as hairdressers',
                    subtitle: '272 signatures in the last hour'),
                SizedBox(height: 10),
                PopularTile(
                    title:
                        'Allow Salons and Tattoo parlors to open at same time as hairdressers',
                    subtitle: '272 signatures in the last hour'),
                SizedBox(height: 10),
              ])),
        ),
      ],
    );
  }
}
