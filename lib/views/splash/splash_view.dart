import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/views/splash/splash_view_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../constants/assets/assets_path.dart';

class SplashView extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.assetsSplashBackground),
                  fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 90, bottom: 31),
            child: Column(
              children: [
                Text("Welcome to", style: heading4,),

                SizedBox(height: 1,),

                Image.asset(Assets.assetsAppLogo,
                  width: 127,
                  height: 50,),

                SizedBox(height: 17,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                    style: paragraph1,
                    textAlign: TextAlign.center,
                  ),
                ),

                Spacer(),
                
                Text("POWERED BY" ,style: heading3,),
                SizedBox(height: 6,),
                Text("TECH IDARA", style: heading1,)

              ],
            ),
          ),
        ],
      ),
    );
  } // builder

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel(context);

  // this is initState
  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.init();
  } // onViewModelReady

  // reactive = false (means Stateless)
  // reactive = true (means Stateful)
  @override
  bool get reactive => true;

} // SplashView
