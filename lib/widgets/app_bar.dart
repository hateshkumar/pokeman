// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/widgets/app_spacers.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class PAAppBar {
  static AppBar onlyIcon({
    required BuildContext context,
    String? title,
    Color? color,
    double? fontSize,
    double? iconSize,
    FontWeight? fontWeight,
    bool isDisableBack = true,
  }) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
/*
      leading: InkWell(
        onTap: () {
          if (isDisableBack) {
            Navigator.pop(context);
          }
        },
        child: Container(
          width: width * (iconSize ?? 0.08),
          height: width * (iconSize ?? 0.08),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: APPColors.appRed),
          child: Icon(
            Icons.arrow_back,
            size: width * (iconSize ?? 0.06),
          ),
        ),
      ),
*/
      centerTitle: true,
      title: Text(title!),
      backgroundColor: APPColors.appRed,
      elevation: 0,
    );
  }
}

// ignore: must_be_immutable
class PAAppBarWithout extends StatelessWidget {
  PAAppBarWithout({
    Key? key,
    required this.onPressed,
    required this.title,
    this.isDisableBack = false,
  }) : super(key: key);
  Function() onPressed;
  bool isDisableBack;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      color: APPColors.appRed,
      padding: EdgeInsets.only(
          top: 5.h, left: PASpace.horizontal, right: PASpace.horizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PAText.text(
            text: title,
            fontSize: 16.sp,
            color: APPColors.appWhite,
          ),
          TextButton(
            onPressed: () {
              onPressed.call();
            },
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: APPColors.appWhite),
              child: const Icon(
                Icons.star,
                color: APPColors.appRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
