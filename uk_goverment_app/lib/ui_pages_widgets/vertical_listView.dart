import 'package:flutter/material.dart';
import 'package:uk_goverment_app/ui_pages_widgets/popular_petition_tile.dart';

class VerticalListView extends StatefulWidget {
  @override
  _VerticalListViewState createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 100,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
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
    );
  }
}
