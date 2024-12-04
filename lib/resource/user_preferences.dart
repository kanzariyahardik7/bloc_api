import 'package:bloc_api/model/otp_verification_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveUser(OtpVerificationData data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", data.id ?? 0);
    prefs.setString("token", data.token ?? "");
    prefs.setBool("isLogin", true);
    prefs.setString("refresh_token", data.refreshToken ?? "");
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("id");
    prefs.remove("token");
    prefs.remove("isLogin");
    prefs.remove("refresh_token");
    prefs.remove('api_responses');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    debugPrint("token -----?? $token");
    return token ?? "";
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("refresh_token");
    return token ?? "";
  }

  Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? token = prefs.getInt("id");
    return token ?? 0;
  }

  Future<bool> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogin") ?? false;
  }
}
