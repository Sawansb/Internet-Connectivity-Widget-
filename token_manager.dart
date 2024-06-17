import 'package:battrackmobileapp/shared_prefrence_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  String? _token;

  String? get token => _token;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(SharedPrefenceKeys.tokenKey);
  }

  Future<void> updateToken(String? token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefenceKeys.tokenKey, token ?? '');
  }
}
