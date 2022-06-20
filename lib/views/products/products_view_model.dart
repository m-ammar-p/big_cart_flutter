import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/models/golbal_class.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:stacked/stacked.dart';

class ProductsViewModel extends BaseViewModel {

  bool isLoading = true;
  final _authService = locator<AuthService>();
  final _productService = locator<ProductService>();
  final _cartService = locator<CartService>();

  List<Product> get cart => _cartService.cart;
  List<Product> get favorites => _cartService.favorites;

  List<Product> products = <Product>[];

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

  onlyProduct() async {
    products = <Product>[];
    products = await runBusyFuture(_productService.getProductsByTitle(accessToken: _authService.authToken,
        text: Global.title));
    notifyListeners();
  } // onlyProduct


  void init({String? title}) async {
    products = <Product>[];

    if(Global.isCategorySelected){
      products = await runBusyFuture(_productService.getProductsByCategory(categoryId: Global.categoryId,accessToken: _authService.authToken,));
      isLoading = false;
      notifyListeners();
    }
    else {

      products = await runBusyFuture(_productService.getProductsByTitle(accessToken: _authService.authToken,
          text: Global.title));
      isLoading = false;
      notifyListeners();
    }
  }// init



  } // ProductsViewModel