import 'package:fintrack/helpers/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.onSaved,
    this.onChanged,
    this.initialValue,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      onSaved: onSaved,
      keyboardType: keyboardType,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      textInputAction: TextInputAction.done,
      cursorColor: kBarsColor,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: prefixIcon,
        ),
        prefixIconColor: kBarsColor,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: hintText,
        enabledBorder: styleBorder(color: Colors.grey),
        focusedBorder: styleBorder(),
        errorBorder: styleBorder(color: Colors.red),
        focusedErrorBorder: styleBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder styleBorder({color}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: color ?? kBarsColor),
    );
  }
}
