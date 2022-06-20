import 'package:e_commerce/constants/assets/assets_path.dart';
import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String placeholder;
  final Widget? prefixIcon;
  TextEditingController? controller;
  void Function(String value)? onChanged;
  final ValueChanged<String>? onSubmitted;

  AppTextField(
      {Key? key,
        required this.placeholder,
        this.controller,
        this.prefixIcon,
        this.onChanged,
        this.onSubmitted,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appGreyColorBackground,
        borderRadius: BorderRadius.circular(1),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        style: paragraph1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: placeholder,
          hintStyle:  paragraph1,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 4),
            child: Container(
              width: 48,
              alignment: Alignment.center,
              child: Image.asset(
                Assets.assetsSearchIcon,
                width: 20,
                height: 20,
              ),
            ),
          ),

          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Container(
              width: 49,
              alignment: Alignment.center,
              child: Image.asset(
                Assets.assetsFilter,
                width: 19,
                height: 17,
              ),
            ),
          ),

        ),
      ),
    );
  } //build
} // AppTextField
