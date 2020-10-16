import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/provider.dart';
import 'package:proyecto_po/src/widgets/menu.dart';

class HomeTeacher extends StatelessWidget {
 

  

  @override
  Widget build(BuildContext context) {
     final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profesor'),

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