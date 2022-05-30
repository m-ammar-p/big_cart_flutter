import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_text_form_field.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/login/login_view_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [

            // login background image container
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: screenHeight(context, percentage: 0.75),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.assetsLoginBackground),
                        fit: BoxFit.cover)),
              ),
            ),

            // Welcome Text on background image
            Positioned(
              top: 63,
              left: screenWidth(context, percentage: 0.4),
              child: Text(
                "Welcome",
                style: heading6,
              ),
            ),

            // login Container
            Positioned(
              top: screenHeight(context, percentage: 0.5),
              child: Container(
                height: screenHeight(context, percentage: 1),
                width: screenWidth(context, percentage: 1),
                decoration: BoxDecoration(
                  color: appGreyColorBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),

                child: Form(
                  child: Builder(
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Welcome back !", style: heading5,),

                            Text("Sign in to your account", style: paragraph2,),

                            SizedBox(height: 20,),

                            AppTextFormField(
                            controller: viewModel.emailController,
                            validator: viewModel.validateEmail,
                              isPassField: false,
                              hintText: "Email Address",
                              prefixIconPath: Assets.assetsEmailIcon,

                            ),



                        SizedBox(height: 30,),
                        ElevatedButton(onPressed: () => viewModel.onLoginTap(context), child: Text("Login"),),

                          ],
                        ),
                      );
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //builder

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  bool get reactive => true;
} //LoginView
