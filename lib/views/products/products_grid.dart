import 'package:e_commerce/shared/widgets/product_card.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:e_commerce/views/products/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductsGrid extends ViewModelBuilderWidget<ProductsViewModel> {
  @override
  Widget builder(
      BuildContext context, ProductsViewModel viewModel, Widget? child) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth(context) > screenHeight(context) ? 4 : 2,
          childAspectRatio: 181 / 234,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
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

    );
  } // builder

  @override
  ProductsViewModel viewModelBuilder(BuildContext context) =>
      ProductsViewModel();
} // ProductsGrid
