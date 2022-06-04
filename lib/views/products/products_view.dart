import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/customized_appbar.dart';
import 'package:e_commerce/views/home/products_grid.dart';
import 'package:e_commerce/views/products/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductsView extends ViewModelBuilderWidget<ProductsViewModel> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        color: appGreyColorBackground,
        child: Column(
          children: [
            CustomizedAppBar(title: "Vegetables",
              leadingPath: Assets.assetsBackArrowBlack,
            trailingPath: Assets.assetsFilterBlack,
            leadingOnTap: ()=> locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView),),

            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ProductsGrid(),
                ),
            ),

          ],
        ),
      ),
    );
  } // builder

  @override
  viewModelBuilder(BuildContext context) => ProductsViewModel();
} // ProductsView
