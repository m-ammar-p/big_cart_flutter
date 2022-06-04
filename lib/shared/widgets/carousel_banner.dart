import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/model/carousel_item_model.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:flutter/material.dart';


class CarouselBanner extends StatefulWidget {

  final List<CarouselItem> items;

  const CarouselBanner({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    double bannerWidth = screenWidth(context) - 34;
    double bannerHeight = bannerWidth * (253 / 350);

    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index, pageIndex) => Container(
              margin: const EdgeInsets.only(bottom: 20,),
              alignment: Alignment.bottomLeft,
              width: bannerWidth,
              height: bannerHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.items[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: bannerWidth * (44 / 380) +
                      (screenWidth(context) > screenHeight(context) ? 40 : 0),
                  bottom: screenWidth(context) > screenHeight(context)
                      ? 40
                      : bannerHeight * (78 / 283),
                ),
                child: Text(
                  widget.items[index].text,
                  style: paragraph5,
                ),
              ),
            ),
            options: CarouselOptions(
              initialPage: 0,
              height: screenWidth(context) > screenHeight(context)
                  ? 150
                  : (bannerHeight + 20),
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: screenWidth(context) > screenHeight(context)
                ? 40
                : bannerHeight * (50 / 303),
            left: 33,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  widget.items.length,
                      (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 6),
                    duration: const Duration(milliseconds: 400),
                    width: index == pageIndex ? 24 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index == pageIndex ? appGreenColor : Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } // build
} // CarouselBanner