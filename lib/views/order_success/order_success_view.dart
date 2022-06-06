import 'package:e_commerce/base/app_setup.locator.dart';
import 'package:e_commerce/base/app_setup.router.dart';
import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/shared/widgets/app_main_button.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/order_success/order_success_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderSuccessView extends ViewModelBuilderWidget {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, ChangeNotifier viewModel, Widget? child) {
    return WillPopScope(
      onWillPop: () async {
        locator<NavigationService>().clearStackAndShow(Routes.homeView);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.assetsOrderSuccess,
                    width: (screenWidth(context) * (227 / 414)),
                  ),
                  const SizedBox(height: 45),
                  Text(
                    'Congrats',
                    style: heading5.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Your Order ',
                          style: paragraph8,
                          children: [
                            TextSpan(
                                text: '# 234324234',
                                    // + id.toString().padLeft(5, '0'),
                                style: paragraph9),
                            TextSpan(
                                text: ' is\nSuccessfuly Received',
                                style: paragraph8)
                          ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(
                context,
                percentage: (90 / 896),
              ),
            ),
            AppMainButton(
                onTap: () {
                  locator<NavigationService>()
                      .clearStackAndShow(Routes.homeView);
                },
                text: 'Go to home'),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  } // builder

  @override
  ChangeNotifier viewModelBuilder(BuildContext context) => OrderSuccessViewModel();
} // OrderSuccessView
