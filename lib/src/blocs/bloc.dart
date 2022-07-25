import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators
{
  // final _email    = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();
  final _email    = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Retrieve data from stream
  Stream<String> get email    => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) => true);

  // Add data to stream 
  Function(String) get changeEmail    => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail    = _email.value;
    final validPassword = _password.value;

    //TODO
    print('email is $validEmail');
    print('password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

// Global bloc instance
// final bloc = Bloc(); 
