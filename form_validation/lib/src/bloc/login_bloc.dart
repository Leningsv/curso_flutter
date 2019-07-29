import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  get emailController => _emailController.stream;

  set emailController(value) {
    this._emailController.sink.add(value);
  }

  get passwordController => _passwordController.stream;

  set passwordController(value) {
    this._passwordController.sink.add(value);
  }

  dispose() {
    this._emailController?.close();
    this._passwordController?.close();
  }
}