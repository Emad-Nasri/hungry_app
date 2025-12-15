import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  /*كلمة ستاتيك قبل اي فونكشن او قبل اي فاريابل
  بتخليني اشوفها من اي كلاس تاني او من اي فايل تاني*/
  static const String _tokenKey = 'auth_token';
  //اول ما تعمل ريجستر او لوغ ان مناخد منك  التوكين على طول نحتفظ به
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(_tokenKey);
    return null;
  }

  static Future<void> clearToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
  }
}
