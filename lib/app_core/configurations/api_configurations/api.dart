import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../app_core.dart';

part 'my_client.dart';

class Api {

  ///---------------Home APIS -----------------

  Future<ApiResponse> get getTransaction async {
    ApiResponse res = await MyClient().get(ENP.customerTransaction);
    return res;
  }
}
