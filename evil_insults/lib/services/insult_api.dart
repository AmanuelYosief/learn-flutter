import 'dart:convert';

import 'package:evil_insults/model/insult.dart';
import 'package:http/http.dart' as http;

class InsultServices {
  List<Insult> insultDatabase = [];

  Future<void> getInsult() async {
    insultDatabase = [];
    print("HELLOOOOOOO");
    final response = await http
        .get('https://evilinsult.com/generate_insult.php?lang=en&type=json');

    print("BYEE");

    print("BUTTTTTTTT");
    print(response);
    print(response.body);
    // This is retrieved as Json already, but let's store it convert it anyways
    print('Getting data');
    var jsonData = jsonDecode(response.body);
    print(response.body);
    // Check if the response is sucessful

    // Server has returned a 200 OK response
    Insult insult =
        Insult(insult: jsonData['insult'], created: jsonData['created']);
    insultDatabase.add(insult);
  }
}
