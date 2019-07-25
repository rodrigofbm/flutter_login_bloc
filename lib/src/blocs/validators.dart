import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String,String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains("@")) {
        sink.add(email);
      }else {
        sink.addError("Invalid e-mail");
      }
    }
  );

  final validatePassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length > 3) {
        sink.add(password);
      }else {
        sink.addError('The password must have at least 5 or more characters');
      }
    }
  );
}