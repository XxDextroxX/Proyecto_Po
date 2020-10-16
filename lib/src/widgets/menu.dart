import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle, color: Colors.blue,),
            title: Text('Mi perfil'),
            onTap: ()=> Navigator.pop(context),
          ),
           ListTile(
            leading: Icon(Icons.note, color: Colors.blue,),
            title: Text('Mis cursos'),
            onTap: ()=> Navigator.pushNamed(context, 'cursos')
          ),
           ListTile(
            leading: Icon(Icons.book,color: Colors.blue,),
            title: Text('Mis calificaciones'),
          ),
           ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Configuracion'),
          ),
           ListTile(
            leading: Icon(Icons.info_outline, color: Colors.blue,),
            title: Text('Acerca de'),
          ),
           ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue,),
            title: Text('Cerrar sesión'),
            onTap: ()=> Navigator.pushReplacementNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}