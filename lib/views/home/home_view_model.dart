import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/models/carousel_item_model.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/carousel_services.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:e_commerce/services/category_service.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class HomeViewModel extends BaseViewModel {

  final _carouselService = locator<CarouselService>();
  final _authService = locator<AuthService>();
  final _categoryService = locator<CategoryService>();
  final _productService = locator<ProductService>();
  final _cartService = locator<CartService>();

  List<Category> categories = <Category>[];
  List<Product> products = <Product>[];

  List<Product> get cart => _cartService.cart;
  List<Product> get favorites => _cartService.favorites;

  List<CarouselItem> carouselList = <CarouselItem>[];

  TextEditingController searchController = TextEditingController();


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

  void addOrRemoveFavorites(Product product) {
    _cartService.addOrRemoveFavorites(product);
    notifyListeners();
  } // addOrRemoveFavorites

  bool isFavorited(Product product) {
    int index = favorites.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  } // isFavorited

  void init() async {
    categories = <Category>[];
    products = <Product>[];

    carouselList = _carouselService.getCarouselList();

    categories = await runBusyFuture(_categoryService.getAllCategories(accessToken: _authService.authToken));
    products = await runBusyFuture(_productService.getAllProducts(accessToken: _authService.authToken));
    notifyListeners();
  } // init

  void navigateToCategoryPage() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signupView);
  } // navigateToCategoryPage

} // HomeViewModel