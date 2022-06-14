import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_main_button.dart';
import 'package:e_commerce/shared/widgets/app_text_form_field.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stacked/stacked.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  @override
  Widget builder(BuildContext context, LoginViewModel viewModel,
      Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [

          // background image
          SliverAppBar(
            // Welcome Text on background image
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome", style: heading6,),
              ],
            ),

            pinned: true,
            backgroundColor: appGreenSecondary.withOpacity(1),
            expandedHeight: screenHeight(context,percentage: 0.5),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(Assets.assetsLoginBackground,
                width: double.maxFinite,

                fit: BoxFit.cover,),
            ),
          ),

          // login Container
          SliverToBoxAdapter(
            // login Container
            child: Container(
              height: screenHeight(context, percentage: 0.9),
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
                        Text(
                          "Welcome back !",
                          style: heading5,
                        ),

                        Text(
                          "Sign in to your account",
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
                        // Password Field
                        AppTextFormField(
                          controller: viewModel.passwordlController,
                          validator: viewModel.validatePassword,
                          hintText: "Password",
                          isPassField: true,
                          prefixIconPath: Assets.assetsPasswordIcon,
                        ),

                        // switch and forgot text
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 20, right: 2),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterSwitch(
                                  padding: 0,
                                  height: 16,
                                  width: 30.0,
                                  toggleSize: 13,
                                  switchBorder: Border.all(
                                      width: 1.3, color: appGreyColor),
                                  toggleBorder: Border.all(
                                      width: 1.3, color: appGreyColor),
                                  activeColor: appGreenColor,
                                  inactiveColor: appWhiteColor,
                                  value: viewModel.isSwitched,
                                  onToggle: viewModel.toggleSwitch),

                              SizedBox(
                                width: 8,
                              ),
                              // Remember me text
                              Text(
                                "Remember me",
                                style: paragraph1,
                              ),
                              Spacer(),
                              Text(
                                "Forgot Password",
                                style:
                                paragraph1.copyWith(color: appBlueColor),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        // Login Button
                        AppMainButton(
                          text: "Login",
                          onTap: () => viewModel.onLoginTap(context),
                          isLoading: viewModel.isLoading,
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
                                  "Don’t have an account ? ",
                                  style: paragraph3,
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Sign up",
                                    style: paragraph1.copyWith(
                                        color: Colors.black),
                                  ),
                                  onTap: () => viewModel.navigateToSignupPage(),
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
    );
  } // builder

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  // reactive = false (means Stateless)
  // reactive = true (means Stateful)
  @override
  bool get reactive => true;
} //LoginView
