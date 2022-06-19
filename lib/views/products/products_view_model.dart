import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:stacked/stacked.dart';

class ProductsViewModel extends BaseViewModel {

  final _authService = locator<AuthService>();
  final _productService = locator<ProductService>();

  List<Product> products = <Product>[];

  void init() async {

    products = <Product>[];
    products = await runBusyFuture(_productService.getAllProducts(accessToken: _authService.authToken));
    notifyListeners();
  } // init

} // ProductsViewModel