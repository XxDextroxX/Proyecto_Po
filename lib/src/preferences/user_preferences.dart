
import 'package:proyecto_po/src/models/users_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  static final UserPreferences _userPrefs = new UserPreferences._internal();

  factory UserPreferences(){
    return _userPrefs;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  set token(String token)=> _prefs.setString('token',token);
  String get token => _prefs?.getString('token')??"";

  set user(UsersModels user)=> _prefs.setString('user', usersModelsToJson(user));

  UsersModels get user=> _prefs.getString('user')!= null?usersModelsFromJson(_prefs.getString('user')):null;









}