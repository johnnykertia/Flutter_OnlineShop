import 'package:flutter_online_shop/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    //simpan data ke local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> removeAuthData() async {
    //Remove semua data di storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      return null;
    }
  }

  Future<bool> isAuth() async {
    //cek apakah sudah login atau belum
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return true;
    } else {
      return false;
    }
  }
}
