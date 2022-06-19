import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_main_button.dart';
import 'package:e_commerce/shared/widgets/app_text_form_field.dart';
import 'package:e_commerce/shared/widgets/customized_appbar.dart';
import 'package:e_commerce/shared/widgets/loading_animation.dart';
import 'package:e_commerce/views/shipping_information/shipping_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShippingView extends ViewModelBuilderWidget<ShippingViewModel> {
  const ShippingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ShippingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: appGreyColorBackground,
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Builder(builder: (context) {
          return Column(
            children: [
              CustomizedAppBar(
                title: "Checkout",
                leadingPath: Assets.assetsBackArrowBlack,
                leadingOnTap: () => viewModel.navigateToCartPage(),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 16, right: 16, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        if (viewModel.isLoading) ...[
                          LoadingAnimation(),
                        ] else if (!viewModel.isLoading) ...[
                          // Name Field
                          AppTextFormField(
                            controller: viewModel.nameController,
                            validator: viewModel.validateName,
                            hintText: "Name",
                            prefixIconPath: Assets.assetsNameIcon,
                          ),

                          SizedBox(
                            height: 5,
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

                          // Phone Field
                          AppTextFormField(
                            controller: viewModel.phoneController,
                            validator: viewModel.validatePhoneNumber,
                            hintText: "Phone",
                            prefixIconPath: Assets.assetsPhoneIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          // Address Field
                          AppTextFormField(
                            controller: viewModel.addressController,
                            validator: viewModel.validateAddress,
                            hintText: "Address",
                            prefixIconPath: Assets.assetsAddressIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          // Zip Code Field
                          AppTextFormField(
                            controller: viewModel.zipCodeController,
                            validator: viewModel.validateZipCode,
                            hintText: "Zip code",
                            prefixIconPath: Assets.assetsZipcodeIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          // City Field
                          AppTextFormField(
                            controller: viewModel.cityController,
                            validator: viewModel.validateCity,
                            hintText: "City",
                            prefixIconPath: Assets.assetsMapIcon,
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          // Country Field
                          AppTextFormField(
                            controller: viewModel.countryController,
                            validator: viewModel.validateCountry,
                            hintText: "Country",
                            prefixIconPath: Assets.assetsGlobeIcon,
                          ),
                          SizedBox(
                            height: 500,
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              ),

              // Next Button
              AppMainButton(
                text: "Next",
                onTap: () => viewModel.onNextTap(context),
              ),

              const SizedBox(height: 36),
            ],
          );
        }),
      ),
    );
  }

  @override
  ShippingViewModel viewModelBuilder(BuildContext context) =>
      ShippingViewModel();

  @override
  bool get reactive => true;
} // ShippingView
