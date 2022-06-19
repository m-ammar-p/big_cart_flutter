import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      alignment: Alignment.center,
      child:  SpinKitChasingDots(
        size: 100,
        color: appGreenColor.withOpacity(0.8),
        duration: Duration(milliseconds: 1500),
      ),
    );
  } // build
} // LoadingAnimation
