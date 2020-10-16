import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/provider.dart';
import 'package:proyecto_po/src/pages/home_alumno.dart';
import 'package:proyecto_po/src/pages/home_page.dart';
import 'package:proyecto_po/src/pages/login_page.dart';
import 'package:proyecto_po/src/pages/page_cursos.dart';
import 'package:proyecto_po/src/preferences/user_preferences.dart';
import 'package:proyecto_po/src/providers/login_provider.dart';
import 'package:proyecto_po/src/widgets/wrapper.dart';
 
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    UserPreferences pref = new UserPreferences();
    await pref.initPrefs();
    runApp(MyApp());
}


 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(child:  MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context)=> LoginPage(),
        'wraper':(BuildContext context)=> Wrapper(),
        'cursos': (BuildContext context)=> PageCursos()
      },
    ) ,
    
    );
    
    
  }
}