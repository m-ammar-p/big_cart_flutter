import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class TitleWithArrowButton extends StatelessWidget {

  final title;
  const TitleWithArrowButton({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          this.title,
          style: heading5,
        ),
        Spacer(),
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.assetsForwardArrow,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  } // build
} // TitleWithArrowButton
