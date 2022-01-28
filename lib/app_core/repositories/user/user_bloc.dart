import 'dart:async';
import 'dart:convert';

import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/app_core/configurations/local_sotrage_configurations/local_storage.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';

class AuthBloc {
  DBHelper dbHelper = DBHelper();
  LocalStorage localStorage = LocalStorage();

  Future<void> setLoggedInStatus(String status) async {
    try {
      await _saveInfo(status);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> setLoggedOutStatus() async {
    try {
      await _removeInfo();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  _saveInfo(String status) async {
    // ignore: avoid_print
    print('------------save user info--------------');

    await localStorage.write("status", status);
  }

  _removeInfo() async {
    // ignore: avoid_print
    print('------------remove user info--------------');

    await localStorage.delete(LocalStorageKey.token);
  }

  Future<String> autoLogin() async {
    var status = await localStorage.read(LocalStorageKey.loginStatue);
    if (status != null && status == "1") {
      return status;
    } else {
      return "0";
    }
  }

  Future<int> saveFavorite(PokemonDetailModel detailModel) async {
    try {
      Map<String, String> data = {
        'id': detailModel.id.toString(),
        'name': detailModel.name.toString(),
        'image': detailModel.sprites!.other!.home!.frontShiny.toString()
      };
      return dbHelper.insert(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeFavorite(String id) async {
    try {
      dbHelper.removeFavorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<PokemonFavoriteModel>> getFavorite() async {
    return await dbHelper.getData();
  }

  Future<bool> isFavorite(String id) async {
    try {
      return dbHelper.isFavorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
