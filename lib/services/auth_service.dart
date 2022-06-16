import 'dart:convert';
import 'package:e_commerce/constants/api/api_url.dart';
import 'package:e_commerce/models/api_response_model.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/shared/widgets/public_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  String? get authToken => _user?.accessToken;
  String? get email => _user?.email;
  final String dataKey = "user";

  User? _user;

  SnackBar snakbar = PublicSnackBar(content: Text(""));

  Future<String?> loadUser() async {
    // Obtain shared preferences.
    final pref = await SharedPreferences.getInstance();
    try {
      _user = User.fromJson(jsonDecode(pref.getString(dataKey) ?? ''));
      return authToken;
    } catch (e) {
      return null;
    }
  }

  Future<void> resetUser() async {
    // Obtain shared preferences.
    final pref = await SharedPreferences.getInstance();
    pref.remove(dataKey);
    pref.clear();
    _user = null;
  }

  Future<void> _saveUser() async {
    // Obtain shared preferences.
    final pref = await SharedPreferences.getInstance();
    // Save value to 'user' key.
    await pref.setString(dataKey, jsonEncode(_user?.toJson()));
  }

  Future<bool> loginUser(String email, String password) async {

    try{
      await _login(email, password);
      return true;
    }catch(e){
      return false;
    }

  } // loginUser

  Future<User?> _login(String email, String password) async {
    var signinUrl = Uri.parse(ApiBaseUrl.baseUrl + '/user/signin');
    try {
      var response = await http.post(signinUrl, body: {
        "email": email,
        "password": password,
      }); // post

      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;

      _user =
      APIResponse<User>.fromJson(decodedJson, User.fromJson(decodedJson['data'])).data!;

      print("From auth Service $authToken");
      _saveUser();
      return _user;

    } catch (e) {
     snakbar = PublicSnackBar(content: Text("Invalid Email or Password"));
      throw e.toString();
    }
  } // _login

} // AuthService
