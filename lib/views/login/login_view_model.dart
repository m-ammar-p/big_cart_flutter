import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();

  void onLoginTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }
  } // onLoginTap

  String? validateEmail(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter an email";
    }

    if(!value.contains("@")) {
      return "Please enter a valid email";
    }
    return null;
  } // validateEmail


  String? validatePassword(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter password";
    }

    if(value.length < 6) {
      return "Password must contains at least 6 characters";
    }
    return null;
  } // validatePassword

} // LoginViewModel