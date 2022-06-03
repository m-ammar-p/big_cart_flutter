import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class CategoryLayout extends ViewModelBuilderWidget<HomeViewModel> {
  const CategoryLayout({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, viewModel, Widget? child) {
    return SizedBox(
      height: 110,
      child: Column(
        children: [
          // Categories Items
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        margin: const EdgeInsets.only(
                          left: 10,
                          top: 17,
                          bottom: 11,
                          right: 10,
                        ),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue.withOpacity(0.1),
                        ),
                        child: Image.asset(Assets.assetsVegetables),
                      ),
                      Flexible(
                        child: Text(
                          "Vegetables",
                          style: paragraph7.copyWith(fontSize: 12,),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ], // main Column ends
      ),
    );
  } // builder

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}