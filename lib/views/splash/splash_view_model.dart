import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {

  final BuildContext context;

  SplashViewModel(this.context);

  final _authService = locator<AuthService>();


  void init() async {

    // this works like SetState() -> just call it
    // notifyListeners();

    await Future.delayed(Duration(seconds: 2),);



    var authToken = await runBusyFuture(_authService.loadUser());
    if(authToken != null){
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signupView);
      return;
    }

    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.loginView);

  } //init

} // SplashViewModel