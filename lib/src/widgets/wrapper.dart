import 'package:flutter/material.dart';
import 'package:proyecto_po/src/models/users_models.dart';
import 'package:proyecto_po/src/pages/home_alumno.dart';
import 'package:proyecto_po/src/pages/home_page.dart';
import 'package:proyecto_po/src/pages/home_profesor.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    final UsersModels params = ModalRoute.of(context).settings.arguments;
    if (params.role == "STUDENT") {

      return HomeStudent();

      
    }else if(params.role=="PROFESSOR"){

      return HomeTeacher();

    }else{
      return HomePage();
    }
    
    
  }
}