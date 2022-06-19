import 'dart:convert';

import 'package:e_commerce/constants/api/api_url.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getAllProducts ({required String? accessToken}) async{

    var productUrl = Uri.parse(ApiBaseUrl.baseUrl + '/product');

    try{

      var response = await http.get(productUrl,
        headers: {"Authorization": "Bearer ${accessToken.toString()}"}
      ); // get

      List<dynamic> decodedJson = jsonDecode(response.body)["data"]!;

      List<Product> products = decodedJson.map((object) => Product.fromJson(object)).toList();

      return products;

    }catch(e){
      throw e.toString();
    }

  } // getAllProducts
} // ProductService