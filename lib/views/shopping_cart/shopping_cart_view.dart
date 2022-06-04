import 'package:e_commerce/views/shopping_cart/shopping_cart_view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ShoppingCartView extends ViewModelBuilderWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping cart",)
      ),
    );

  } // builder

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => ShoppingCartViewModel();
} // ShoppingCartView
