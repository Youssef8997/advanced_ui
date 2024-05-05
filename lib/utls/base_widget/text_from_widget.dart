import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manger/color_manger.dart';
import '../manger/font_manger.dart';

class TextFormWidget extends StatefulWidget {
  final String label;
  final String hint;
  final bool? isFilled;
  final Color? filledColor;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? suffixActive;
  final bool? active;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final Function(String?)? onSumbted;
  final Function(String?)? onChange;
  const TextFormWidget(
      {super.key,
      required this.label,
      this.controller,
      this.suffix,
      this.suffixActive,
      this.isFilled,
      this.filledColor,
      this.validator,
      this.active,
      this.onSumbted,
      this.textStyle,
      this.textInputFormatter,
      this.textInputType,
      required this.hint,
      this.onChange});

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatter,
      enabled: widget.active,
      controller: widget.controller,
      onFieldSubmitted: widget.onSumbted,
      style: widget.textStyle,
      keyboardType: widget.textInputType,
      onChanged: widget.onChange,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 60, minHeight: 50),
        suffix: widget.suffixActive,
        suffixIcon: widget.suffix,
        label: Text(
          widget.label,
          style: FontsManger.smallFont(context)?.copyWith(
              color:
                  widget.isFilled == true ? Colors.white : ColorsManger.pColor),
        ),
        hintText: widget.hint,
        filled: true,
        fillColor: widget.filledColor ?? ColorsManger.white,
        alignLabelWithHint: true,
        hintStyle: FontsManger.smallFont(context)?.copyWith(
            color:
                widget.isFilled == true ? Colors.white : ColorsManger.pColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: ColorsManger.pColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: ColorsManger.pColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: ColorsManger.pColor)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: ColorsManger.pColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(width: 1, color: Colors.red.withOpacity(.4))),
      ),
      validator: widget.validator ??
          (value) {
            if (value != null && value.isEmpty) {
              return "من فضلك تاكد من تلك المعلومات ";
            } else {
              return null;
            }
          },
    );
  }
}
