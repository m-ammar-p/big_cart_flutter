import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_view.dart';
import 'package:flutter/material.dart';

void main() async {


  // singleton Locator which was generated from stacked_generator
  // it locates services and create their instances
  await setupLocator();

  runApp(const AppView());
} // main
