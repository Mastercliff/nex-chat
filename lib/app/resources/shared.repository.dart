import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  void setIsLogged(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged', value);
  }
}
