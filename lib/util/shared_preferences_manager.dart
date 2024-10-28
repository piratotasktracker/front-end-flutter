import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager{
  final SharedPreferences prefs;

  const SharedPreferencesManager({required this.prefs});

  void setToken(String token){
    prefs.setString(_PrefKeys.token, token);
  }

  void removeToken(){
    prefs.remove(_PrefKeys.token);
  }

  String? getToken(){
    return prefs.getString(_PrefKeys.token);
  }
  
}

class _PrefKeys {
  static const String token = "token";
}