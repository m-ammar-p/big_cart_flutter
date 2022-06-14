import 'dart:convert';

import 'package:e_commerce/constants/api/api_url.dart';
import 'package:e_commerce/models/api_response.dart';
import 'package:http/http.dart' as http;

class AuthService {

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

      User user =
      APIResponse<User>.fromJson(decodedJson, User.fromJson(decodedJson['data'])).data!;

      return user;

    } catch (e) {
      print(e.toString());
      throw e.toString();

    }
  } // _login
} // AuthService
