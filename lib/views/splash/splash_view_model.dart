import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {

  final BuildContext context;

  SplashViewModel(this.context);

  void init() async {

    // this works like SetState() -> just call it
    // notifyListeners();

    await Future.delayed(Duration(seconds: 5),);

    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.loginView);

  } //init

} // SplashViewModel