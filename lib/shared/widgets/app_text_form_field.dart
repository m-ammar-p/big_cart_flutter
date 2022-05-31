import 'package:e_commerce/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  Widget? suffixIcon;
  final String prefixIconPath;
  final String? hintText;
  final bool isPassField;
  final bool isPhoneNum;

   AppTextFormField({Key? key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
     this.isPhoneNum = false,
    required this.prefixIconPath,
     this.isPassField = false,

  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: TextFormField(

          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.isPhoneNum ? TextInputType.number : TextInputType.text,
          obscureText: widget.isPassField ? _isHidden : !_isHidden,
          obscuringCharacter: '•',
          style: heading3.copyWith(
        letterSpacing: 15 * (3 / 100)),

          decoration: InputDecoration(
            labelStyle: heading3,
            constraints: BoxConstraints(
              maxHeight: 100,
            ),
            fillColor: appWhiteColor,
            filled: true,
            hintText: widget.hintText,

            prefixIcon: widget.prefixIcon ??
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 21),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: FittedBox(
                      child: ImageIcon(
                        AssetImage(widget.prefixIconPath),
                        color: appGreyColor,
                      ),
                    ),
                  ),
                ),
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1)
              ),

            suffixIcon: widget.isPassField
                ? GestureDetector(
              onTap: _togglePasswordView,
              child: _isHidden
                  ? const Icon(
                Icons.visibility_off,
                color: appGreyColor,
              )
                  : const Icon(Icons.visibility, color: appGreyColor),
            )
                : null,

          ),

        ),
      );
    }
 // build
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    }); // setState()
  }
} // AppTextFormField
