import 'dart:async';

import 'dart:math';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        if(!regExp.hasMatch(email)) {
          sink.addError('El email tiene un formato incorrecto');
          return;
        }
        sink.add(email);
      }
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length <= 6){
        sink.addError('Mas de 6 caracteres');
        return;
      }
      sink.add(password);
    }
  );
}
