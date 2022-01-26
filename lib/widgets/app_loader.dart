import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_constants/app_colors.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

Widget loader = Lottie.asset(
  'assets/json/loading.json',
  height: 10.h,
);

Widget error({String? text, String? tryAgainText, Function()? onPressed}) =>
    Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      PAText.text(
        text: text ?? "Something went wrong",
        fontWeight: FontWeight.bold,
        fontSize: 1.8.h,
      ),
      InkWell(
          onTap: onPressed,
          child: PAText.text(
            text: tryAgainText ?? "Try Again",
            fontWeight: FontWeight.bold,
            fontSize: 2.h,
            color: APPColors.appRed,
          ))
    ]));

Widget notFound({
  String? text,
}) =>
    Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      PAText.text(
          text: text ?? "Data not found",
          fontWeight: FontWeight.bold,
          fontSize: 2.h,
          color: APPColors.appTextGrey),
    ]));
