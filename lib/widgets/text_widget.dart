import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:sizer/sizer.dart';

class PAText extends Text {
  const PAText(String data, {Key? key})
      : super(
          data,
          key: key,
        );

  PAText.headerText(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextStyle? style,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          maxLines: overflow != null ? 2 : null,
          style: style ??
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: fontSize ?? 4.h,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: color ?? APPColors.appBlack,
                overflow: overflow,
              ),
        );
  PAText.subHeadertext(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? textAlign,
      TextStyle? style,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          textAlign: textAlign,
          maxLines: overflow != null ? 2 : null,
          style: style ??
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: fontSize ?? 2.h,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? APPColors.appTextGrey,
                overflow: overflow,
              ),
        );
  PAText.text(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextStyle? style,
      TextDecoration? decoration,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          maxLines: overflow != null ? 2 : null,
          style: style ??
              TextStyle(
                decoration: decoration,
                fontFamily: 'Montserrat',
                fontSize: fontSize ?? 2.h,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? Colors.black,
                overflow: overflow,
              ),
        );
}
