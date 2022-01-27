import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';


class HomeService extends ChangeNotifier {
  late Api api;

  update(api) {
    this.api = api;
  }


  Future<ApiResponse> get getPokemonList async {
    ApiResponse res = await api.getPokemonList.catchError((e) {
      return ApiFail(ApiModel()..message = e.toString());
    });
    return res;
  }
  Future<ApiResponse>  getPokemonDetail({String? url}) async {
    ApiResponse res = await api.getPokemonDetail(url!).catchError((e) {
      return ApiFail(ApiModel()..message = e.toString());
    });
    return res;
  }

}
