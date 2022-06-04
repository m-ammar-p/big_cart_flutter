import 'package:e_commerce/views/order_success/order_success_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class OrderSuccessView extends ViewModelBuilderWidget {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OrderSuccessView"),
      ),
    );
  } // builder

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => OrderSuccessViewModel();
} // OrderSuccessView
