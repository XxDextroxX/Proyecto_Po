import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/provider.dart';
import 'package:proyecto_po/src/widgets/menu.dart';

class HomeStudent extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
     final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumno'),

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