

import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/cart_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShoppingCartViewModel extends BaseViewModel {

  final _cartService = locator<CartService>();

  List<Product> get cart => _cartService.cart;

  double get totalCost => shippingCharges + subTotal;
  double _shippingCharges = 1.9;

  double get shippingCharges => _shippingCharges;

  double get subTotal {
    double total = 0.0;
    try {
      for (Product item in cart) {
        total += (item.price! * item.qty!);
      }
      return total;
    } catch (e) {
      return 0.0;
    }
  }

  void addToCart(Product product){
    _cartService.addProductToCart(product: product);
    notifyListeners();
  } // addToCart

  void removeFromCart(Product product) {
    _cartService.removeProductFromCart(product);
    notifyListeners();
  } // removeFromCart

  int productQuantity(Product product) {
    return _cartService.getQuantityFromProduct(product);
  } // productQuantity

  void deleteFromCart(Product product) {
    _cartService.deleteProduct(product);
    notifyListeners();
  } // deleteFromCart

  void navigateToHomePage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
  } // navigateToHomePage

  void navigateToShippingPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.shippingView);
  } // navigateToShippingPage

} // ShoppingCartViewModel