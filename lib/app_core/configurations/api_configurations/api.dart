import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../app_core.dart';

part 'my_client.dart';

class Api {

  ///---------------Home APIS -----------------

  Future<ApiResponse>  getPokemonList(String url) async {
    ApiResponse res = await MyClient().get(url);
    return res;
  }
  Future<ApiResponse>  getPokemonDetail(String url) async {
    ApiResponse res = await MyClient().get(url);
    return res;
  }
}
