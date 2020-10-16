import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/login_bloc.dart';
export 'package:proyecto_po/src/bloc/login_bloc.dart';
class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  Provider({Key key, Widget child})
  :super(key:key, child:child);
  

    
  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>(aspect: Provider).loginBloc;
  }


}