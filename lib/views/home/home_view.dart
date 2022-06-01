import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/widgets/app_text_field.dart';
import 'package:e_commerce/shared/widgets/carousel_banner.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    double bannerWidth = screenWidth(context) - 34;

    return Scaffold(
      body: Container(
        height: screenHeight(context, percentage: 1),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              AppTextField(
                placeholder: "Search keywords...",
                controller: viewModel.searchController,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    CarouselBanner(items: viewModel.carouselList),
                  ],
                ),
              ),
            ],
          ),
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
