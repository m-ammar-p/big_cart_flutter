import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {

  final String title;
  final String? leadingPath;
  final VoidCallback? leadingOnTap;
  final String? trailingPath;
  final VoidCallback? trailingOnTap;

  const CustomizedAppBar({Key? key,
    required this.title,
    this.leadingPath,
    this.leadingOnTap,
    this.trailingPath,
    this.trailingOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 29,
            child: Text(
              "Vegetables",
              style: heading6.copyWith(color: Colors.black),
            ),
          ),

          if (leadingPath != null)
            Positioned(
              left: 0,
              bottom: 29,
              child: GestureDetector(
                onTap: leadingOnTap,
                child: Container(
                  height: 26,
                  width: 40,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(left: 17),
                  child: Image.asset(
                    leadingPath!,
                    width: 23,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

          if (trailingPath != null)
            Positioned(
              right: 0,
              bottom: 29,
              child: GestureDetector(
                onTap: trailingOnTap,
                child: Container(
                  height: 26,
                  width: 40,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 17.41),
                  child: Image.asset(
                    trailingPath!,
                    width: 18.59,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  } // build
} //CustomizedAppBar
