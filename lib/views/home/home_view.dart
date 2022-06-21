import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_text_field.dart';
import 'package:e_commerce/shared/widgets/carousel_banner.dart';
import 'package:e_commerce/shared/widgets/floating_button.dart';
import 'package:e_commerce/shared/widgets/loading_animation.dart';
import 'package:e_commerce/shared/widgets/title_with_arrow_button.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/home/category_Layout.dart';
import 'package:e_commerce/views/home/home_view_model.dart';
import 'package:e_commerce/views/home/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// padding: EdgeInsets.only(top: 50, left: 16, right: 16),

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    double bannerWidth = screenWidth(context) - 34;

    return Scaffold(
      floatingActionButton: FloatingButton(onPressed: () =>
          locator<NavigationService>().pushNamedAndRemoveUntil(
              Routes.shoppingCartView)),
      body: Container(
        height: screenHeight(context, percentage: 1),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 16, right: 16, bottom: 10),
              child: AppTextField(
                  placeholder: "Search keywords...",
                  controller: viewModel.searchController,
                  onChanged: (text) => viewModel.searchController.text = text,
                  onSubmitted: (text) {
                    viewModel.isOnlyProduct = true;
                    viewModel.navigateToCategoryPage();
                  },
                onSuffixIconTap: () => viewModel.onLogoutTap(),
              ),
            ),

            if(viewModel.isLogoutLoading)
              LoadingAnimation(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: Column(
                      children: [
                        CarouselBanner(items: viewModel.carouselList),
                        TitleWithArrowButton(title: "Categories",),
                        CategoryLayout(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),


                  Container(
                    color: appGreyColorBackground,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 16, right: 16),
                      child: Column(
                        children: [
                          TitleWithArrowButton(title: "Featured products",),
                          ProductsGrid(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  } // builder

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel();


  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
  } // onViewModelReady

  @override
  bool get reactive => true;
} // HomeView
