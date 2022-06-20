import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/widgets/customized_appbar.dart';
import 'package:e_commerce/views/shopping_cart/cart_item_list.dart';
import 'package:e_commerce/views/shopping_cart/cost_with_main_button.dart';
import 'package:e_commerce/views/shopping_cart/shopping_cart_view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartView extends ViewModelBuilderWidget<ShoppingCartViewModel> {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ShoppingCartViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomizedAppBar(
              title: "Shopping Cart",
              leadingPath: Assets.assetsBackArrowBlack,
              leadingOnTap: () => viewModel.navigateToHomePage(),
            ),
            Expanded(
              child: CartItemList(),
            ),
            CostWithMainButton(),
          ],
        ),
      ),
    );
  } // builder

  @override
  ShoppingCartViewModel viewModelBuilder(BuildContext context) =>
      ShoppingCartViewModel();

  @override
  bool get reactive => true;
} // ShoppingCartView
