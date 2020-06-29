import 'package:flutter/material.dart';
import 'package:uk_goverment_app/services/api_requests.dart';

class TestApi extends StatefulWidget {
  @override
  _TestApistate createState() => _TestApistate();
}

class _TestApistate extends State<TestApi> {
  bool _loading = false;
  var newInsult;

  Future<void> getInsult() async {
    ApiService apiServices = ApiService();
    await apiServices.getFeed();
    setState(() {
      _loading = false;
    });
    newInsult = apiServices.petitionDatabase;
  }

  @override
  void initState() {
      _loading = true;
    super.initState();
    getInsult();
  }

  @override
  void didUpdateWidget(TestApi oldWidget) {
 
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
