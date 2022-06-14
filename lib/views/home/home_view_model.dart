import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/models/carousel_item_model.dart';
import 'package:e_commerce/services/carousel_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class HomeViewModel extends BaseViewModel {

  final _carouselService = locator<CarouselService>();

  TextEditingController searchController = TextEditingController();

  List<CarouselItem> carouselList = <CarouselItem>[];


  void init() async {
    carouselList = _carouselService.getCarouselList();
  } // init()

  void navigateToCategoryPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signupView);
  } // navigateToCategoryPage

} // HomeViewModel