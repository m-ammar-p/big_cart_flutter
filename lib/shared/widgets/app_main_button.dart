import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';


class AppMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AppMainButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              appGreenSecondary,
              appGreenColor,
            ],
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: appGreenColor.withOpacity(0.25),
              offset: const Offset(0, 10),
              blurRadius: 9,
            ),
          ],
        ),
        child:  Text(text, style: heading7,),
      ),
    );
  } // build
} // AppMainButton