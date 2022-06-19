import 'dart:convert';
import 'package:e_commerce/constants/api/api_url.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {

  Future<List<Category>> getAllCategories({required String? accessToken}) async {

    var categoryUrl = Uri.parse(ApiBaseUrl.baseUrl + '/category');
    try {

      var response = await http.get(categoryUrl,
          headers:{"Authorization": "Bearer ${accessToken.toString()}"}
      ); // get

      List<dynamic> decodedJson = jsonDecode(response.body)["data"];

      List<Category> categories = decodedJson.map((obj) => Category.fromJson(obj)).toList();

      return categories;

    }catch(e){
      throw e.toString();
    }
  } // getAllCategories

} // CategoryService