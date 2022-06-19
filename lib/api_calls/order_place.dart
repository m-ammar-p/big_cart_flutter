import 'dart:convert';

import 'package:e_commerce/constants/api/api_url.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<int> placeOrder(
      {required String? accessToken,
      required String name,
      required String email,
      required String phno,
      required String address,
      required String zip,
      required String city,
      required String country,
      required List<Map<String, dynamic>> items}) async {
    var orderUrl = Uri.parse(ApiBaseUrl.baseUrl + '/order');

    try {
      var response = await http.post(
        orderUrl,
        headers: {
          "Authorization": "Bearer ${accessToken.toString()}",
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "phoneNumber": phno,
            "address": address,
            "zip": zip,
            "city": city,
            "country": country,
            "items": items,
          },
        ), // jsonEncode
      ); // post
      var decodedJson =
          jsonDecode(response.body)["data"] as Map<String, dynamic>;
      int id = decodedJson["id"];
      return id;
    } catch (e) {
      throw e.toString();
    }
  } // placeOrder

} // ApiCalls
