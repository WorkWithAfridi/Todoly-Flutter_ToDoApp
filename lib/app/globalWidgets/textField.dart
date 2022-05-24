import 'package:flutter/material.dart';
import 'package:todoly/app/data/globalConstants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController TEC;
  final String hint;
  final TextInputType textInputType;
  final int maxLines;
  final bool isPassword;
  const CustomTextField({
    Key? key,
    required this.TEC,
    required this.hint,
    required this.textInputType,
    required this.maxLines,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: defaultTS,
      cursorColor: primaryColor,
      controller: TEC,
      maxLines: maxLines,
      obscureText: isPassword,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: defaultTS.copyWith(
          color: greyColor,
        ),
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: greyColor,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(
            customBorderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: secondaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            customBorderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: greyColor,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(
            customBorderRadius,
          ),
        ),
        fillColor: greyColor.withOpacity(.1),
        filled: true,
        contentPadding: const EdgeInsets.all(
          10,
        ),
      ),
    );
  }
}
