import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/model/carousel_item_model.dart';
import 'package:e_commerce/services/carousel_services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {

  final _carouselService = locator<CarouselService>();

  TextEditingController searchController = TextEditingController();

  List<CarouselItem> carouselList = <CarouselItem>[];


  void init() async {
    carouselList = _carouselService.getCarouselList();
  } // init()

} // HomeViewModel