import 'package:e_commerce/api_calls/api_calls.dart';
import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShippingViewModel extends BaseViewModel {

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final _authService = locator<AuthService>();
  final _cartService = locator<CartService>();

  List<Product> get cart => _cartService.cart;

  void onNextTap(BuildContext context) async {
    if (!(Form.of(context)?.validate() ?? false)) {
      return;
    }

    isLoading = true;
    // it will terminate automatically when task will be done

    try {
      int orderId = await ApiCalls.placeOrder(
          accessToken: _authService.authToken,
          name: nameController.text,
          email: emailController.text,
          phno: phoneController.text,
          address: addressController.text,
          zip: zipCodeController.text,
          city: cityController.text,
          country: countryController.text,
          items: cart.map((e) => e.toJson()).toList(),); // placeOrder

      _cartService.clearCart();
      isLoading = false;
      notifyListeners();
      navigateOrderSuccesPage(orderId: orderId);
    } catch(e) {
      isLoading = false;
      print(e.toString());
      notifyListeners();
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

  void navigateOrderSuccesPage({required int orderId}) {
    locator<NavigationService>().navigateTo(Routes.orderSuccessView,
        arguments: OrderSuccessViewArguments(orderId: orderId));
  } // navigateToSignupPage

  void navigateToCartPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.shoppingCartView);
  } // navigateToHomePage


} // ShippingViewModel