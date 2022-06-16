import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {


  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();

  final _authService = locator<AuthService>();

  void init() async {

    // await runBusyFuture(_authService.resetUser());
    // this works like SetState() -> just call it
    // notifyListeners();
    var authToken = await runBusyFuture(_authService.loadUser());

    print(authToken);
    if(authToken != null){
      locator<NavigationService>().replaceWith(Routes.homeView);
      return;
    }
  } //init

  void onLoginTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }

    isLoading = true;
    // it will terminate automatically when task will be done
    var res = await runBusyFuture(_authService.loginUser(emailController.text, passwordlController.text));
    isLoading = false;
    ScaffoldMessenger.of(context)
        .showSnackBar(_authService.snakbar);

    if(res){
      navigateToHomePage();
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



  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {

        isSwitched = true;
        textValue = 'Switch Button is ON';
        notifyListeners();


      print(textValue);
    }
    else
    {

        isSwitched = false;
        textValue = 'Switch Button is OFF';
        notifyListeners();


      print(textValue);
    }
  } // toggleSwitch

  void navigateToSignupPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signupView);
  } // navigateToSignupPage

  void navigateToHomePage() {
    locator<NavigationService>().replaceWith(Routes.homeView);
  } // navigateToSignupPage
} // LoginViewModel