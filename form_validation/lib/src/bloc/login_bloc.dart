import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      this._emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      this._passwordController.stream.transform(validatePassword);

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) {
        return true;
      });

  Function(String) get changeEmail => this._emailController.sink.add;

  Function(String) get changePassword => this._passwordController.sink.add;

  String get email => this._emailController.value;
  String get password => this._passwordController.value;

  dispose() {
    this._emailController?.close();
    this._passwordController?.close();
  }
}
