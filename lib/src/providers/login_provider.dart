import 'dart:convert';

import 'package:http/http.dart' as http;
class LoguinProvider{

 final host ='https://proyecto6to.herokuapp.com';

 Future<Map<String, dynamic>> loguin(String correo, String password)async{

   final url = '$host/user/login';
   final resp = await http.post(url, body: {
     "email": correo,
     "password": password,
   });
   return json.decode(resp.body);


 }
}