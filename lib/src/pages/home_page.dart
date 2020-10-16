import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/provider.dart';
import 'package:proyecto_po/src/widgets/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
     final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),

      ),
      drawer: MenuPage(),
      body: Center(
        child: Column(
          children: [
            
          ],
        )
      ),
    );
  }
}