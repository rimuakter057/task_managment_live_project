


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/user_model.dart';

class AuthController {
  static String? accessToken;
  static UserModel? userModel;

  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user-data';

  static Future<void> saveUserData(String accessToken, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('access-token', accessToken);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));

  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken =  sharedPreferences.getString('access-token', );
    return accessToken != null;


  }

  static Future<void> getUserData() async {

  }


  }

  Future<void> clearUserData() async {

}