import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/components/build_outer_border.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onPressed;
  final int? maxLines;
  //final bool readOnly;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onPressed,
    //  this.readOnly = false,
    this.onSaved,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,

      //    readOnly: readOnly,
      onSaved: onSaved,
      maxLines: maxLines,

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        // prefixIcon: Icon(prefixIcon) ,
        // suffixIcon:
        //     suffixIcon != null
        //         ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
        //         : null,
        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: onPressed, icon: Icon(suffixIcon))
                : null,

        border: buildOuterBorder(),
        enabledBorder: buildOuterBorder(),
        focusedBorder: buildOuterBorder(),
        errorBorder: buildErrorOuterBorder(),

        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      ),
    );
  }
}
