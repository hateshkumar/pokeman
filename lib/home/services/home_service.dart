import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';


class HomeService extends ChangeNotifier {
  late Api api;

  update(api) {
    this.api = api;
  }

}
