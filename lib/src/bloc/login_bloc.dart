import 'dart:async';
import 'package:proyecto_po/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //insertar valores al stream

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // recuperar salida del stream

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  String get email=> _emailController.value;
  String get password=> _passwordController.value;

  //Mezclar streams
  Stream<bool> get formValidator => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  dispose(){
    _emailController?.close();
    _passwordController?.close();

  }

}