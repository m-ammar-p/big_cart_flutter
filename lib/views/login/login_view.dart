import 'package:e_commerce/views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login View"),
      ),
    );
  } //builder

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
} //LoginView