import 'package:shared_preferences/shared_preferences.dart';


class CashHelper {

  static late SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({required key,required value})async{

    return await sharedPreferences.setBool(key, value);
  }
  

  static bool getData({required key}){

    return sharedPreferences.getBool(key) ?? false;
  }



}