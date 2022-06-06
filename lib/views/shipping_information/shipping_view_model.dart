import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShippingViewModel extends BaseViewModel {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void onNextTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }
  } // onNextTap

  String? validateName(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter name";
    }
    return null;
  } // validateName

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

  String? validateAddress(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter an address";
    }
    return null;
  } // validateAddress

  String? validateZipCode(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter zip code";
    }
    if(value.length < 5 || value.length > 5) {
      return "Zip Code must contains exactly 5 digits";
    }
    return null;
  } // validateZipCode


  String? validateCity(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter city";
    }
    return null;
  } // validateCity

  String? validateCountry(String? value) {

    if(value == null || value.isEmpty) {
      return "Please enter country";
    }
    return null;
  } // validateCity

  void navigateOrderSuccesPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.orderSuccessView);
  } // navigateToSignupPage


} // ShippingViewModel