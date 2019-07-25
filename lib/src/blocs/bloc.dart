import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();

  Stream<String> get email => _emailSubject.stream.transform(validateEmail);
  Stream<String> get password => _passwordSubject.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _emailSubject.sink.add;
  Function(String) get changePassword => _passwordSubject.sink.add;

  submit() {
    final validEmail = _emailSubject.value;
    final validPass = _passwordSubject.value;

    print('The e-mail is $validEmail and the password is $validPass');
  }

  dispose() {
    _emailSubject.close();
    _passwordSubject.close();
  }
}

final bloc = new Bloc();