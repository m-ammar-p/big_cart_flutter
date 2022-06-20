import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/models/golbal_class.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/customized_appbar.dart';
import 'package:e_commerce/shared/widgets/loading_animation.dart';
import 'package:e_commerce/views/products/products_grid.dart';
import 'package:e_commerce/views/products/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductsView extends ViewModelBuilderWidget<ProductsViewModel> {
  String? title;
  int? id;

  ProductsView({
    Key? key,
    this.title,
    this.id,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProductsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        color: appGreyColorBackground,
        child: Column(
          children: [
            CustomizedAppBar(
              title: viewModel.products.length <= 0 ? "Not Found" : this.title ?? "" ,
              leadingPath: Assets.assetsBackArrowBlack,
              trailingPath: Assets.assetsFilterBlack,
              leadingOnTap: () => locator<NavigationService>()
                  .pushNamedAndRemoveUntil(Routes.homeView),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child:
                    viewModel.isLoading ? LoadingAnimation() : ProductsGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  } // builder

  @override
  viewModelBuilder(BuildContext context) => ProductsViewModel();

  @override
  void onViewModelReady(ProductsViewModel viewModel) {
    viewModel.init();
  }

  @override
  bool get reactive => true;
} // ProductsView
