
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal{

  static final SPGlobal _instance = SPGlobal._mandarina();

  SPGlobal._mandarina();

  factory SPGlobal(){
    return _instance;
  }
  //late indica que la variable será definida luego
  late SharedPreferences _pref;

 Future<void> initShared()async {
   _pref = await SharedPreferences.getInstance();
  }

  set fullName(String value){
    _pref.setString("name", value);
  }

  set adress(String value){
    _pref.setString("adress", value);
  }

  set gender(int value){
    _pref.setInt("gender", value);
  }

  set darkMode(bool value){
    _pref.setBool("darkMode", value);
  }

  String get  fullName{
    return _pref.getString("name")?? "";
  }
  String get  adress{
    return _pref.getString("adress")?? "";
  }

  int get  gender{
    return _pref.getInt("gender")?? 1;
  }
  bool get  darkMode{
    return _pref.getBool("darkMode")?? false;
  }

}