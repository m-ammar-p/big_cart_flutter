class APIResponse<T extends ApiDataModel> {
  String? message;
  int? statusCode;
  T? data;

  APIResponse({this.message, this.statusCode, this.data});

  APIResponse.fromJson(Map<String, dynamic> json, T data) {
    message = json['message'];
    statusCode = json['statusCode'];
    this.data = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
} // APIResponse

abstract class ApiDataModel {
  Map<String,dynamic> toJson();
} // ApiDataModel

class User implements ApiDataModel {
  int? id;
  String? email;
  String? phone;
  String? password;
  String? accessToken;

  User({this.id, this.email, this.phone, this.password, this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['accessToken'] = this.accessToken;
    return data;
  }
} // User
