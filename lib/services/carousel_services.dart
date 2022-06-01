import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/model/carousel_item_model.dart';


class CarouselService {
  List<CarouselItem> getCarouselList() {
    List<CarouselItem> carouselList = <CarouselItem>[];
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: Assets.assetsBanner));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: Assets.assetsBanner));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: Assets.assetsBanner));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: Assets.assetsBanner));
    return carouselList;
  }
}