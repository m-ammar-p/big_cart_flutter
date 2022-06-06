import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/widgets/cart_item_card.dart';
import 'package:e_commerce/views/shopping_cart/shopping_cart_view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class CartItemList extends ViewModelBuilderWidget {
  const CartItemList({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {
   return ListView.builder(

     itemCount: 10,
     itemBuilder: (BuildContext context, int index,) => CartItemCard(
         shadeColor: 'ffc0a0',
         image: Assets.assetsFreshPeach,
         price: 725,
         title: "Fresh Peach",
         unit: "150 lbs",
         qtyInCart: 5,
         onMinusTap: ()=>{},
         onPlusTap: ()=>{},),
   );

  } // builder

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => ShoppingCartViewModel();
} // CartItemList
