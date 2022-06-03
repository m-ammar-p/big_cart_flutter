import 'package:e_commerce/shared/widgets/product_card.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductsGrid extends ViewModelBuilderWidget<HomeViewModel> {
  @override
  Widget builder(
      BuildContext context, HomeViewModel viewModel, Widget? child) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth(context) > screenHeight(context) ? 4 : 2,
          childAspectRatio: 181 / 234,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      itemCount: 6,
      itemBuilder: (context, index) => ProductCard(
        shadeColor: 'ffc0a0',
        favoriteToggle: false,
        price: 352.0,
        title: 'Fresh Fruit',
        onFavoriteButtonTap: () {  },
        onMinusTap: () {  },
        image: '',
        unit: '',
        qtyInCart: 0,
        onPlusTap: () {  },
      ),
      shrinkWrap: true,
      primary: false,
      physics: ScrollPhysics(),
    );
  } // builder

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
} // ProductsGrid
