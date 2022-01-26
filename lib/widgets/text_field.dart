import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_app/app_core/app_constants/app_colors.dart';
import 'package:pokemon_app/widgets/decorations.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import 'app_spacers.dart';

enum KeyBoardType {
  text,
  email,
  number,
}

// ignore: must_be_immutable
class PATextField extends StatefulWidget {
  PATextField(
      {Key? key,
      String? hintText,
      String? errorText,
      TextEditingController? controller,
      Function(String)? validator,
      Function()? onTap,
      KeyBoardType? keyboardType,
      double? borderRadius,
      Widget? sufixWidget,
      bool isValid = false,
      bool isName = false,
      bool readOnly = false,
      IconData? icon})
      : _hint = hintText,
        _controller = controller,
        _validator = validator,
        _keyboardType = keyboardType,
        _errorText = errorText,
        _borderRadius = borderRadius,
        _icon = icon,
        _sufixWidget = sufixWidget,
        _isValid = isValid,
        _isName = isName,
        _readOnly = readOnly,
        _onTap = onTap,
        super(key: key);
  final String? _hint;
  final String? _errorText;
  final double? _borderRadius;
  // ignore: prefer_final_fields
  TextEditingController? _controller;
  // ignore: unused_field
  final Function(String)? _validator;
  final Function()? _onTap;
  // ignore: prefer_final_fields
  KeyBoardType? _keyboardType = KeyBoardType.text;
  final IconData? _icon;
  final Widget? _sufixWidget;
  // ignore: prefer_final_fields
  bool _isValid;
  // ignore: prefer_final_fields
  bool _isName;
  final bool _readOnly;

  @override
  State<PATextField> createState() => _PATextFieldState();
}

class _PATextFieldState extends State<PATextField> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: PADecorations.textfield(
              isError: widget._isValid, borderRadius: widget._borderRadius),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: widget._readOnly,
                  controller: widget._controller,
                  keyboardType: _getKeyboardType(),
                  inputFormatters: _getInputFormatters(),
                  onChanged: widget._validator,
                  onTap: widget._onTap,
                  decoration: InputDecoration(
                      prefixIcon: widget._icon == null
                          ? null
                          : Icon(widget._icon, color: APPColors.appTextGrey),
                      contentPadding: widget._icon != null
                          ? null
                          : EdgeInsets.symmetric(horizontal: 5.w),
                      hintText: widget._hint ?? '',
                      hintStyle: const TextStyle(color: APPColors.appTextGrey),
                      border: InputBorder.none),
                ),
              ),
              widget._sufixWidget != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: widget._sufixWidget,
                    )
                  : Container(),
            ],
          ),
        ),
        PASpacer(
          height: 0.7.h,
        ),
        !widget._isValid
            ? const Center()
            : Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: PAText.subHeadertext(
                  text: widget._errorText ?? 'Please enter valid text',
                  color: APPColors.appRed,
                  fontWeight: FontWeight.bold,
                  fontSize: 1.5.h,
                ),
              ),
        PASpacer(),
      ],
    );
  }

  _getKeyboardType() {
    if (widget._keyboardType == KeyBoardType.text) {
      return TextInputType.text;
    } else if (widget._keyboardType == KeyBoardType.email) {
      return TextInputType.emailAddress;
    } else if (widget._keyboardType == KeyBoardType.number) {
      return TextInputType.number;
    }
  }

  _getInputFormatters() {
    if (widget._keyboardType == KeyBoardType.number) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
        FilteringTextInputFormatter.deny(RegExp("[abFeG]")),
      ];
    } else if (widget._isName) {
      return [
        FilteringTextInputFormatter.deny(RegExp("[0-9]")),
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      ];
    } else {
      return null;
    }
  }
}
