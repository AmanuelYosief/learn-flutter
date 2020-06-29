import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uk_goverment_app/model/petition.dart';

class ApiService {
  List<Petition> petitionDatabase;

  String petitionURL = 'http://lda.data.parliament.uk/epetitions.json';
  Future<void> getFeed() async {
    petitionDatabase = [];
    print('Database created');
    final response = await http.get(petitionURL);
    print(response.body);

    var jsonData = jsonDecode(response.body);
    print('Json decoded');
    String id = jsonData['results']['identifier']['value'];

    print('THE ID IS ' + id);



    // ID is at Identifier, _value:
    Petition petition =
        Petition(id: jsonData['results']['identifier']['value']);
    petitionDatabase.add(petition);
  }
}
