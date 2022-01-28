import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/app_core/repositories/user/user_bloc.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';

class HomeService extends ChangeNotifier {
  late Api api;

  update(api) {
    this.api = api;
  }

  Future<ApiResponse>  getPokemonList(String url) async {
    ApiResponse res = await api.getPokemonList(url).catchError((e) {
      return ApiFail(ApiModel()..message = e.toString());
    });
    return res;
  }

  Future<ApiResponse> getPokemonDetail({String? url}) async {
    ApiResponse res = await api.getPokemonDetail(url!).catchError((e) {
      return ApiFail(ApiModel()..message = e.toString());
    });
    return res;
  }


}
