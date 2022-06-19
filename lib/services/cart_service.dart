import 'package:e_commerce/models/product_model.dart';

class CartService {

  List<Product> _cart = <Product>[];
  List<Product> get cart => _cart;

  List<Product> _favorites = <Product>[];
  List<Product> get favorites => _favorites;



  void addProductToCart({required Product product}) {

    int index = _cart.indexWhere((element) => element.id == product.id);

    if(index ==  -1){
      product.qty = 1;
      _cart.add(product);
    }else{
      _cart[index].qty = (_cart[index].qty ?? 0 ) + 1;
    }
  } // addProductToCart

  void removeProductFromCart(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      if (_cart[index].qty == 1) {
        deleteProduct(_cart[index]);
      } else {
        _cart[index].qty = (_cart[index].qty ?? 2) - 1;
      }
    }
  } // removeProductFromCart

  void deleteProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      _cart.removeAt(index);
    }
  } // deleteProduct

  void clearCart() {
    _cart = <Product>[];
  } // clearCart

  int getQuantityFromProduct(Product product) {
    int index = _cart.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      return _cart[index].qty!;
    } else {
      return 0;
    }
  } // getQuantityFromProduct

  void addOrRemoveFavorites(Product product) {
    int index = _favorites.indexWhere((element) => element.id == product.id);
    if (index == -1) {
      _favorites.add(product);
    } else {
      _favorites.removeAt(index);
    }
  } // addOrRemoveFavorites
} // CartService