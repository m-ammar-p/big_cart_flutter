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
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) => ProductCard(
        shadeColor: viewModel.products[index].color,
        price: viewModel.products[index].price,
        title: viewModel.products[index].title ?? "",
        image: viewModel.products[index].image,
        unit: viewModel.products[index].unit,
        qtyInCart: viewModel.productQuantity(viewModel.products[index]),
        favoriteToggle: viewModel.isFavorited(viewModel.products[index]),
        onFavoriteButtonTap: () => viewModel.addOrRemoveFavorites(viewModel.products[index]),
        onMinusTap: () => viewModel.removeFromCart(viewModel.products[index]),
        onPlusTap: () => viewModel.addToCart(viewModel.products[index]),
      ),
      shrinkWrap: true,
      primary: false,
      physics: ScrollPhysics(),
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
} // ProductsGrid
