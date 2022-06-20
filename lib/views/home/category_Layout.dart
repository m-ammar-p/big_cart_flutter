import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/models/golbal_class.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class CategoryLayout extends ViewModelBuilderWidget<HomeViewModel> {
  const CategoryLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return SizedBox(
      height: 110,
      child: Column(
        children: [
          // Categories Items
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Global.categoryId = viewModel.categories[index].id ?? 0;
                      Global.title = viewModel.categories[index].title ?? "Not Found";
                      Global.isCategorySelected = true;

                      viewModel.navigateToCategoryPage(id: Global.categoryId,
                      title: Global.title);
                    },
                    child: Column(
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
                            color:getCategoryColorFromId(
                                viewModel.categories[index].id ?? 0),
                          ),
                          child: Image.asset(
                            getCategoryIconFromId(
                                viewModel.categories[index].id ?? 0),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            viewModel.categories[index].title ?? "veg",
                            style: paragraph7.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ], // main Column ends
      ),
    );
  } // builder

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.init();
  } // onViewModelReady

  @override
  bool get reactive => true;
} // CategoryLayout
