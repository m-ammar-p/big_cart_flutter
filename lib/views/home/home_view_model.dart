import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/models/carousel_item_model.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/carousel_services.dart';
import 'package:e_commerce/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class HomeViewModel extends BaseViewModel {

  final _carouselService = locator<CarouselService>();
  final _authService = locator<AuthService>();
  final _categoryService = locator<CategoryService>();

  List<Category> categories = <Category>[];

  TextEditingController searchController = TextEditingController();

  List<CarouselItem> carouselList = <CarouselItem>[];


  void init() async {
    categories = <Category>[];
    carouselList = _carouselService.getCarouselList();
    categories = await runBusyFuture(_categoryService.getAllCategories(accessToken: _authService.authToken));
    notifyListeners();
  } // init

  void navigateToCategoryPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signupView);
  } // navigateToCategoryPage

} // HomeViewModel