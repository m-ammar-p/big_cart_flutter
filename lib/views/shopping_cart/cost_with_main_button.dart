import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_main_button.dart';
import 'package:e_commerce/views/shopping_cart/shopping_cart_view-model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'title_with_cost.dart';

class CostWithMainButton extends ViewModelBuilderWidget<ShoppingCartViewModel> {

   const CostWithMainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, ShoppingCartViewModel viewModel, Widget? child) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      constraints: const BoxConstraints(minHeight: 100),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 22),
          TitleWithCost(
            title: 'Subtotal',
            cost: viewModel.subTotal, // viewModel.subTotal,
            style: paragraph6,
          ),
          const SizedBox(height: 7),
          TitleWithCost(
            title: 'Shipping charges',
            cost: viewModel.shippingCharges, // viewModel.shippingCharges,
            style: paragraph6,
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            height: 1,
            color: appGreySecondary,
          ),
          TitleWithCost(
            title: 'Total',
            cost: viewModel.totalCost, // viewModel.totalCost,
            style: paragraph5,
          ),
          const SizedBox(height: 16),
          AppMainButton(
              onTap: () => viewModel.navigateToShippingPage(),
              text: 'Checkout'),
          const SizedBox(height: 36),
        ],
      ),
    );
  } // build

  @override
  ShoppingCartViewModel viewModelBuilder(BuildContext context) => ShoppingCartViewModel();

  @override
  bool get reactive => true;
} // CostWithMainButton