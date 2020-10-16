import 'package:flutter/material.dart';
import 'package:proyecto_po/src/bloc/provider.dart';
import 'package:proyecto_po/src/models/users_models.dart';
import 'package:proyecto_po/src/preferences/user_preferences.dart';
import 'package:proyecto_po/src/providers/login_provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
   bool _bandera = true;
  
   final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = new GlobalKey<ScaffoldState>();
    
    return Scaffold(
        key: scaffoldKey,
        body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context){

      final size = MediaQuery.of(context).size;
      final fondo = Container(
        height: size.height*1,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
              Colors.blueAccent,
            ]
          )
        ),
      );
      final head = Container(
        
          padding: EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.supervised_user_circle, color: Colors.blue,size: 100,),
              Text('Ingrese sus datos', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25) ),
            ],
          ),
      );
      return Stack(
            alignment: Alignment.center,
            children: [
            fondo,
            head,
          ],
          
      );
  }


  Widget _loginForm(BuildContext context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 180,
              ),
            ),
            Container(
              width: size.width*0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Column(
                children: [

                  Form(
                    key: formKey,
                    child: Column(
                    children: [
                        _email(bloc),
                        SizedBox(height: 30,),
                      _password(bloc),
                      SizedBox(height: 30,),
                    ],
                  )),
                  
                  
                 _boton(bloc),
                 SizedBox(height: 8,),
              
                 Text('¿Olvidó su contraseña?', style: TextStyle(color: Colors.blue, ),),
                 SizedBox(height: 8,),
                 Text('¿No tienes cuenta? Registrate', style: TextStyle(color: Colors.blue, ),),
                 SizedBox(height: 30,),
                  //_password(),
                ],
              ),
            )
          ],
        ),
    );
  }

  Widget _email(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        icon: Icon(Icons.email, color: Colors.blue,),
        hintText: 'ejemplo@email.com',
        labelText: 'Correo Electrónico:',
        errorText: snapshot.error,
        

      ),
      onChanged: bloc.changeEmail,
      //onEditingComplete: ()=>ponVisto(),
      onFieldSubmitted: bloc.changeEmail,
       validator: (v)=>null,
    );
  },
    );

    
  }

  Widget _password(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextFormField(
      obscureText: _bandera,
      decoration: InputDecoration(
        icon: Icon(Icons.enhanced_encryption, color: Colors.blue,),
        labelText: 'Escriba su contraseña:',
        errorText: snapshot.error

      ),
      onChanged: (v)=> bloc.changePassword(v),
      onFieldSubmitted: bloc.changePassword,
      validator: (v)=>null,
    ); 
  },
    );

    
  }

  Widget _boton(LoginBloc bloc){
    // formValidator

    return StreamBuilder(
      stream:  bloc.formValidator,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          padding: EdgeInsets.symmetric( horizontal: 50.0,vertical: 15.0,),
            //onPressed: ()=> snapshot.hasData? Navigator.pushReplacementNamed(context, 'home'): null,
            child: Container(
              //padding: EdgeInsets.symmetric( horizontal: 80.0,vertical: 20.0,),
              child: Text('Ingresar',style: TextStyle(color:Colors.white, ),),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            color: Colors.blue,
            onPressed: snapshot.hasData?()=> _login(context, bloc): null
      
      );
    },
    );

    
  }

  _login(BuildContext context, LoginBloc bloc)async{

      

      if(formKey.currentState.validate()){

                formKey.currentState.save();
                final email = bloc.email;
                final password = bloc.password;
                LoguinProvider login = LoguinProvider();
                



                final resp = await login.loguin(email, password);
                 

                if(resp["success"]){
                  UsersModels usuario =  UsersModels.fromJson(resp['user']);
                  UserPreferences().token=resp['token'];
                  
                 Navigator.pushReplacementNamed(context, 'wraper', arguments:usuario );
                }else{
                  
                  final snackBar = SnackBar(
                    content: Text('Datos erroneos'),
                    duration: Duration(seconds: 2),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
          
                }
                
                
                
              }
              

  }

}