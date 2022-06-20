import 'dart:convert';

import 'package:e_commerce/constants/api/api_url.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {

  Future<List<Product>> getAllProducts({required String? accessToken}) async {
    var productUrl = Uri.parse(ApiBaseUrl.baseUrl + '/product');

    try {
      var response = await http.get(productUrl, headers: {
        "Authorization": "Bearer ${accessToken.toString()}"
      }); // get

      List<dynamic> decodedJson = jsonDecode(response.body)["data"]!;

      List<Product> products =
          decodedJson.map((object) => Product.fromJson(object)).toList();

      return products;
    } catch (e) {
      throw e.toString();
    }
  } // getAllProducts

  Future<List<Product>> getProductsByTitle(
      {required String? accessToken, required String text}) async {
    print("text: ${text}");
    var productUrl =
        Uri.parse(ApiBaseUrl.baseUrl + '/product/search?q=${text}');
    try {
      http.Response responce = await http.get(productUrl,
          headers: {"Authorization": "Bearer ${accessToken.toString()}"});
      List<dynamic> decodedJson = jsonDecode(responce.body)["data"];
      List<Product> products =
          decodedJson.map((object) => Product.fromJson(object)).toList();
      return products;
    } catch (e) {
      throw (e.toString());
    }
  } // getProductsByTitle

  Future<List<Product>> getProductsByCategory(
      {required String? accessToken, required int categoryId}) async {
    var productUrl =
        Uri.parse(ApiBaseUrl.baseUrl + '/product/${categoryId.toString()}');
    try {
      http.Response responce = await http.get(productUrl,
          headers: {"Authorization": "Bearer ${accessToken.toString()}"});
      List<dynamic> decodedJson = jsonDecode(responce.body)["data"];
      List<Product> products =
          decodedJson.map((object) => Product.fromJson(object)).toList();
      return products;
    } catch (e) {
      throw (e.toString());
    }
  } // getProductsByCategory

} // ProductService
