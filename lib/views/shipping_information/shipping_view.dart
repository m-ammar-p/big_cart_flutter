import 'package:e_commerce/base/app_setup.dart';
import 'package:e_commerce/views/shipping_information/shipping_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ShippingView extends ViewModelBuilderWidget {
  const ShippingView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(
        title: Text("shipping view"),
      ),
    );
  }

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => ShippingViewModel();

} // ShippingView
