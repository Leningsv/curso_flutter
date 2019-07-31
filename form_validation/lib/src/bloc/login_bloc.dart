
import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();


  Stream<String> get emailStream => this._emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => this._passwordController.stream.transform(validatePassword);

  Function(String) get changeEmail => this._emailController.sink.add;
  Function(String) get changePassword => this._passwordController.sink.add;

  dispose() {
    this._emailController?.close();
    this._passwordController?.close();
  }
}