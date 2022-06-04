import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {

  final VoidCallback? onPressed;
  const FloatingButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 8, right: 2),
      height: 68.0,
      width: 68.0,
      // alignment: Alignment.center,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: appGreenColor,
          child: Image.asset(Assets.assetsCartWhite,
          width: 21,),
          onPressed: this.onPressed,
        ),
      ),
    );
  } // build
} // FloatingButton
