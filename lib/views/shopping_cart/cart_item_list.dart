import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/widgets/cart_item_card.dart';
import 'package:e_commerce/views/shopping_cart/shopping_cart_view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class CartItemList extends ViewModelBuilderWidget<ShoppingCartViewModel> {
  const CartItemList({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ShoppingCartViewModel viewModel, Widget? child) {
    return ListView.builder(
      itemCount: viewModel.cart.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) =>
          CartItemCard(
        shadeColor: viewModel.cart[index].color,
        image: viewModel.cart[index].image,
        price: viewModel.cart[index].price,
        title: viewModel.cart[index].title,
        unit: viewModel.cart[index].unit,
        qtyInCart: viewModel.productQuantity(viewModel.cart[index]),
        onMinusTap: () => viewModel.removeFromCart(viewModel.cart[index]),
        onPlusTap: () => viewModel.addToCart(viewModel.cart[index]),
        onDeleteTap: () => viewModel.deleteFromCart(viewModel.cart[index]),
      ),
    );
  } // builder

  @override
  ShoppingCartViewModel viewModelBuilder(BuildContext context) =>
      ShoppingCartViewModel();

  @override
  bool get reactive => true;

} // CartItemList
