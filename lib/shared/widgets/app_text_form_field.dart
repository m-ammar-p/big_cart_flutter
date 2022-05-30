import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final String prefixIconPath;
  final String? hintText;
  final bool isPassField;

  const AppTextFormField({Key? key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.hintText,
    required this.prefixIconPath,
    required this.isPassField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: TextFormField(

          validator: validator,
          controller: controller,
          obscureText: isPassField,
          style: heading3.copyWith(
        letterSpacing: 15 * (3 / 100)),

          decoration: InputDecoration(
            labelStyle: heading3,
            constraints: BoxConstraints(
              maxHeight: 100,
            ),
            fillColor: appWhiteColor,
            filled: true,
            hintText: hintText,
            prefixIcon: prefixIcon ??
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 21),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: FittedBox(
                      child: ImageIcon(
                        AssetImage(prefixIconPath),
                        color: appGreyColor,
                      ),
                    ),
                  ),
                ),
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1)
              ),

          ),

        ),
      );
    } // build
} // AppTextFormField
