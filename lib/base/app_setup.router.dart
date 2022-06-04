// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/home/home_view.dart';
import '../views/login/login_view.dart';
import '../views/order_success/order_success_view.dart';
import '../views/products/products_view.dart';
import '../views/shipping_information/shipping_view.dart';
import '../views/shopping_cart/shopping_cart_view.dart';
import '../views/signup/signup_view.dart';
import '../views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String homeView = '/home-view';
  static const String productsView = '/products-view';
  static const String shoppingCartView = '/shopping-cart-view';
  static const String shippingView = '/shipping-view';
  static const String orderSuccessView = '/order-success-view';
  static const all = <String>{
    splashView,
    loginView,
    signupView,
    homeView,
    productsView,
    shoppingCartView,
    shippingView,
    orderSuccessView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.productsView, page: ProductsView),
    RouteDef(Routes.shoppingCartView, page: ShoppingCartView),
    RouteDef(Routes.shippingView, page: ShippingView),
    RouteDef(Routes.orderSuccessView, page: OrderSuccessView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ProductsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProductsView(),
        settings: data,
      );
    },
    ShoppingCartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ShoppingCartView(),
        settings: data,
      );
    },
    ShippingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ShippingView(),
        settings: data,
      );
    },
    OrderSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OrderSuccessView(),
        settings: data,
      );
    },
  };
}
