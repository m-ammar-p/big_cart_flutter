import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_main_button.dart';
import 'package:e_commerce/shared/widgets/app_text_form_field.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends ViewModelBuilderWidget<SignupViewModel> {
  @override
  Widget builder(
      BuildContext context, SignupViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: screenHeight(context, percentage: 1.3),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.assetsSignupBackground),
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

            // Signup Container
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
                  child: Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 16, right: 16, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Create an account text
                          Text(
                            "Create an account",
                            style: heading5,
                          ),

                          // Quickly create account text
                          Text(
                            "Quickly create account",
                            style: paragraph2,
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // Email Field
                          AppTextFormField(
                            controller: viewModel.emailController,
                            validator: viewModel.validateEmail,
                            hintText: "Email Address",
                            prefixIconPath: Assets.assetsEmailIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          AppTextFormField(
                            controller: viewModel.emailController,
                            isPhoneNum: true,
                            validator: viewModel.validatePhoneNumber,
                            hintText: "Phone number",
                            prefixIconPath: Assets.assetsPhoneIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),
                          // Password Field
                          AppTextFormField(
                            controller: viewModel.passwordlController,
                            validator: viewModel.validatePassword,
                            hintText: "Password",
                            isPassField: true,
                            prefixIconPath: Assets.assetsPasswordIcon,
                          ),


                          SizedBox(
                            height: 30,
                          ),

                          // Login Button
                          AppMainButton(
                            text: "Signup",
                            onTap: () => viewModel.onLoginTap(context),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account ? ",
                                    style: paragraph3,
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      "Login",
                                      style: paragraph1.copyWith(
                                          color: Colors.black),
                                    ),
                                    onTap: () => viewModel.navigateToLoginPage(),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // builder

  @override
  SignupViewModel viewModelBuilder(BuildContext context) => SignupViewModel();

  // reactive = false (means Stateless)
  // reactive = true (means Stateful)
  @override
  bool get reactive => true;
} //LoginView
