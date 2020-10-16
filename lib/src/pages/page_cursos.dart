import 'package:flutter/material.dart';
import 'package:proyecto_po/src/models/cursos_models.dart';
import 'package:proyecto_po/src/providers/cursos_provider.dart';

class PageCursos extends StatelessWidget {
  

 final CursosProvider  cursos = new CursosProvider();

  @override
  Widget build(BuildContext context) {
    cursos.getCursos(0, 5);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cursos"),
      ),
      body: SingleChildScrollView(
        
        child: _cursos(),

      ),
    );
  }

  Widget _cursos(){
    return Container(
          child:StreamBuilder(
            stream:  cursos.streamC,
            builder: (BuildContext context, AsyncSnapshot<List<CursesModels>> snapshot){
             if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
             } else {

               return Column(
                 children: snapshot.data.map((e) => ListTile(
                 title: Text('Curso: ${e.name}'),
                 subtitle: Column(
                   children: e.parallels.map((e) => ListTile(
                     title: Text('Paralelo: ${e.letter}'),
                     subtitle: Text('Id paralelo: ${e.parallelId}'),
                   )).toList(),
                 )
               )).toList(),
               );

             }
            },
          ),
        
      );
    
  }
}