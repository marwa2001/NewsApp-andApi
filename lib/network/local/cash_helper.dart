import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static  SharedPreferences sharedPreferences= sharedPreferences;
  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

static Future<bool> putData({
    required String Key,
  required bool Value
})async
{
  return await sharedPreferences.setBool(Key,Value );
}

  static bool? getData({
    required String Key,

  })
  {
    return  sharedPreferences.getBool(Key );
  }
}