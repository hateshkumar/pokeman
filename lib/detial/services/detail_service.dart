import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/app_core/repositories/user/user_bloc.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';

class DetailService extends ChangeNotifier {
  late AuthBloc authBloc;

  update( authBloc) {
    this.authBloc = authBloc;
  }


  Future<int> addFavorite(PokemonDetailModel detailModel) {
   return authBloc.saveFavorite(detailModel);
  }

  Future<bool> checkIfFavorite(String id) {
   return authBloc.isFavorite(id);
  }

  void removeFavorite(String id) {
    authBloc.removeFavorite(id);
  }
}
