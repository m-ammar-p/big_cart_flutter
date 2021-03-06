import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/views/home/home_view.dart';
import 'package:e_commerce/views/login/login_view.dart';
import 'package:e_commerce/views/order_success/order_success_view.dart';
import 'package:e_commerce/views/products/products_view.dart';
import 'package:e_commerce/views/shipping_information/shipping_view.dart';
import 'package:e_commerce/views/shopping_cart/shopping_cart_view.dart';
import 'package:e_commerce/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce',

      // If you've added the stacked_services package then set the navigatorKey, otherwise set
      // your own navigator key
      navigatorKey: StackedService.navigatorKey,
      // Construct the StackedRouter and set the onGenerateRoute function
      onGenerateRoute: StackedRouter().onGenerateRoute,

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
      debugShowCheckedModeBanner: false,
    );
  } // build
} // AppView
