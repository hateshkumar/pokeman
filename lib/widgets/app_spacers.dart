import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';

class PASpacer extends SizedBox {
  PASpacer({
    Key? key,
    double? height,
  }) : super(key: key, height: height ?? PASpace.spacerHeight);
  PASpacer.width({
    Key? key,
    double? width,
  }) : super(key: key, width: width ?? PASpace.spacerWidth);
}
