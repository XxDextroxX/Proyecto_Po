import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_po/src/models/cursos_models.dart';
import 'package:proyecto_po/src/preferences/user_preferences.dart';





class CursosProvider{

  List<CursesModels> listaCursos = new List<CursesModels>();

  final host ='https://proyecto6to.herokuapp.com';

  StreamController<List<CursesModels>> _streamCursos = new StreamController<List<CursesModels>>.broadcast();

    Function(List<CursesModels>) get addCursos => _streamCursos.sink.add;

  // recuperar salida del stream

  Stream<List<CursesModels>> get streamC => _streamCursos.stream;

  dispose(){
    _streamCursos?.close();
  }

  Future<void> getCursos(int x, int y)async{
  
    final url = '$host/courses/?from=$x&limit=$y';
    final resp = await http.get(url,headers: {
      'Authorization' : UserPreferences().token
    });
    print(resp.body);
    final List<Map<String, dynamic>> cursos= List<Map<String, dynamic>>.from(json.decode(resp.body)['data']);
    print(cursos);
    List<CursesModels> misCursos = cursos.map((e) => CursesModels.fromJson(e)).toList();
    listaCursos.addAll(misCursos);
    addCursos(listaCursos);

  }




}