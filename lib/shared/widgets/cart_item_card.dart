import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:e_commerce/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemCard extends StatelessWidget {
  final String? shadeColor;
  final String? image;
  final double? price;
  final String? title;
  final String? unit;
  int qtyInCart;
  VoidCallback onMinusTap;
  VoidCallback onPlusTap;
  VoidCallback onDeleteTap;

  CartItemCard({
    Key? key,
    required this.shadeColor,
    required this.image,
    required this.price,
    required this.title,
    required this.unit,
    required this.qtyInCart,
    required this.onMinusTap,
    required this.onPlusTap,
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          extentRatio: 0.22,
          motion: const ScrollMotion(),
          children: [
            GestureDetector(
              onTap: onDeleteTap,
              child: Container(
                margin: const EdgeInsets.only(top: 11),
                width: (screenWidth(context) * 0.22) - 17,
                alignment: Alignment.center,
                color: appRedColor,
                child: Image.asset(
                  Assets.assetsDeleteIcon,
                  height: 28,
                ),
              ),
            )
          ]),

      // Cart Item Container
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(right: 7),
        margin: const EdgeInsets.only(
          left: 17,
          right: 17,
          top: 11,
        ),
        color: Colors.white,
        child: Row(
          children: [
            // Image Container
            Container(
              width: 104,
              padding: const EdgeInsets.only(top: 15, bottom: 8),
              color: Colors.transparent,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: FittedBox(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Color(
                            int.parse(
                              '0xFF' + shadeColor.toString().substring(1),
                            ),
                          ).withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8, top: 15),
                    child: FittedBox(
                        child: Image.network(image ?? Assets.errorIcon)
                        //  Image.asset(Assets.assetsFreshPeachNobackgound),
                        ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                Text(
                  '\$' + (price ?? 0).toString().padRight(4, '0'),
                  style: paragraph6.copyWith(color: appGreenColor),
                ),
                Text(
                  title ?? '',
                  style: heading7.copyWith(color: Colors.black),

                ),
                Text(
                  unit ?? '',
                  style: paragraph6,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 41,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onPlusTap,
                      child: Container(
                        color: Colors.transparent,
                        height: 31,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Assets.assetsAddIcon,
                          width: 13.5,
                        ),
                      ),
                    ),
                    Text(qtyInCart.toString(),
                    ),
                    GestureDetector(
                      onTap: onMinusTap,
                      child: Container(
                        color: Colors.transparent,
                        height: 31,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Assets.assetsSubtractIcon,
                          width: 13.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  } // build
} // CartListCard
