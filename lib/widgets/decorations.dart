import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
class PADecorations extends BoxDecoration {
  PADecorations.textfield({
    bool isError = false,
    double? borderRadius,
  }) : super(
          borderRadius:
              BorderRadius.circular(borderRadius ?? PASpace.circularSpace),
          color: Colors.white,
          border: Border.all(
              color: isError ? APPColors.appRed : APPColors.appLightGrey,
              width: 2.0),
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
        );

  PADecorations.cicularWithShadow({
    Color? bgColor,
    Color? borderColor,
  }) : super(
          borderRadius: BorderRadius.circular(PASpace.circularSpace),
          color: bgColor ?? Colors.white,
          border: Border.all(
              color: borderColor ?? APPColors.appLightGrey, width: 2.0),
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
        );
  PADecorations.cicularWithShadowWithImage(
      {Color? bgColor, Color? borderColor, required ImageProvider image})
      : super(
          borderRadius: BorderRadius.circular(PASpace.circularSpace),
          color: bgColor ?? Colors.white,
          border: Border.all(
              color: borderColor ?? APPColors.appLightGrey, width: 2.0),
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
        );
  PADecorations.cicularWithShadowNwithoutBorder(
      {Color? color,
      bool boxShadowEnable = true,
      double? circularSpace,
      bool borderActive = false})
      : super(
          borderRadius: BorderRadius.circular(
              circularSpace ?? PASpace.containerCircularSpace),
          color: color ?? Colors.white,
          border: borderActive
              ? Border.all(color: APPColors.appRed, width: 1.0)
              : null,
          boxShadow: !boxShadowEnable
              ? null
              : [
                  const BoxShadow(
                    color: APPColors.appLightGrey,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                ],
        );
  PADecorations.top({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );
  PADecorations.bottom({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  PADecorations.left({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );
  PADecorations.right({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  PADecorations.topWithImage(
      {Color? color, double? circularSpace, required ImageProvider image})
      : super(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        );

  PADecorations.leftWithImage(
      {Color? color, double? circularSpace, required ImageProvider image})
      : super(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
                circularSpace ?? PASpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        );
}
