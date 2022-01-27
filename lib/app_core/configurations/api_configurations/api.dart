import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../app_core.dart';

part 'my_client.dart';

class Api {

  ///---------------Home APIS -----------------

  Future<ApiResponse> get getPokemonList async {
    ApiResponse res = await MyClient().get(ENP.baseUrl+ENP.pokemonList);
    return res;
  }
  Future<ApiResponse>  getPokemonDetail(String url) async {
    ApiResponse res = await MyClient().get(url);
    return res;
  }
}
