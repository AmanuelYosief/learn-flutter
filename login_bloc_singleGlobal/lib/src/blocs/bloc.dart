import 'dart:async';
import 'validators.dart';
// https://www.youtube.com/watch?v=_kuy6S7f2NI&list=TLPQMDkwNjIwMjAbmxkUSb_oig&index=6

class Bloc extends Object with Validators {
  //This is the same as extending validators
  // Private underscore
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  //Events
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retreve data from the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  dispose() {
    _email.close();
    _password.close();
  }
}

// Single global instance
final bloc = Bloc();
