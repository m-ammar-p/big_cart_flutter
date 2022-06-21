import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {

  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  TextEditingController phonelController = TextEditingController();

  final _authService = locator<AuthService>();

  void onSignupTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }
    isLoading = true;
    // it will terminate automatically when task will be done
    var res = await runBusyFuture(_authService.signupUser(emailController.text, phonelController.text, passwordlController.text));
    isLoading = false;


    if(res){
      navigateToLoginPage();
    } else{
      ScaffoldMessenger.of(context)
          .showSnackBar(_authService.snakbar);
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

  String? validatePhoneNumber(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter phone number";
    }

    if(value.length < 11 || value.length > 11) {
      return "Phone number must contains exactly 11 digits";
    }
    return null;
  } // validatePhoneNumber

  String? validatePassword(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter password";
    }

    if(value.length < 6) {
      return "Password must contains at least 6 characters";
    }
    return null;
  } // validatePassword



  void navigateToLoginPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.loginView);
  } // navigateToLoginPage

} // LoginViewModel