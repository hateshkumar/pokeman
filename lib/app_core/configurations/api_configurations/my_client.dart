part of 'api.dart';

class MyClient {
  final Map<String, String> defaultHeaders;
  final http.Client _httpClient = http.Client();
  final baseUrl = ENP.baseUrl;
  final LocalStorage _localStorage = LocalStorage();

  MyClient({this.defaultHeaders = const {}});

  Future<ApiResponse> _generateResponse(Response res) async {
    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    // ignore: avoid_print
    print("BODY ${res.body}");

    try {
      var data = json.decode(res.body);
      _model.status = data['status'];
      _model.message = data["message"] ?? "no msg";
      _model.success = data['success'] ?? _model.status == 200 ? true : false;
      _model.data = _model.status != 200 ? null : json.decode(res.body);

      if (_model.status == 200) {
        _apiResponse = ApiSuccess(_model);
      } else {
        _apiResponse = ApiFail(_model);
      }
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }
    return _apiResponse;
  }

  Future<ApiResponse> get(url, {Map<String, String>? headers}) async {
    // ignore: avoid_print
    print("******** (GET REQUEST) ********");

    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    try {
      url = baseUrl + "$url";
      // headers?.addAll({'Authorization': await _getToken()});
      // ignore: avoid_print
      print("******** (GET REQUEST URL) ********");
      // ignore: avoid_print
      print(url);
      http.Response res = await _httpClient
          .get(Uri.parse(url), headers: {'token': await _getToken()});

      _apiResponse = await _generateResponse(res);
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }

    return _apiResponse;
  }

  Future<ApiResponse> post(String url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    // ignore: avoid_print
    print("******** (POST REQUEST) ********");

    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    try {
      url = baseUrl + url;
      // ignore: avoid_print
      print("******** (Post REQUEST URL) ********");
      // ignore: avoid_print
      print(url);
      // headers!.addAll({'Authorization': await _getToken()});
      // print(headers);
      http.Response res = await _httpClient.post(Uri.parse(url),
          headers: {'token': await _getToken()},
          body: body,
          encoding: encoding);
      _apiResponse = await _generateResponse(res);
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }

    return _apiResponse;
  }

  // ignore: override_on_non_overriding_member
  Future<ApiResponse> delete(url, {Map<String, String>? headers}) async {
    // ignore: avoid_print
    print("******** (DELETE REQUEST) ********");

    url = '$baseUrl$url';
    headers!.addAll(defaultHeaders);
    // headers!.addAll({'Authorization': await _getToken()});
    http.Response res = await _httpClient.get(url, headers: headers);
    return _generateResponse(res);
  }

  Future<String> _getToken() async {
    // ignore: avoid_print
    print("******** (GET TOKEN) ********");
    var token = await _localStorage.read('token');

    // ignore: avoid_print
    print("TOKEN $token");
    return token.toString();
  }

  Future<ApiResponse> getWithBaseUrl(url,
      {Map<String, String>? headers}) async {
    // ignore: avoid_print
    print("******** (GET REQUEST WITHOUT BASE URL) ********");
    // ignore: avoid_print
    print("******** (GET REQUEST URL) ********");
    // ignore: avoid_print
    print(url);

    ApiModel _model = ApiModel()
      ..data = null
      ..success = false;
    ApiResponse _apiResponse = ApiIntial(_model);

    try {
      // headers?.addAll({'Authorization': await _getToken()});
      http.Response res = await _httpClient
          .get(Uri.parse(url), headers: {'token': await _getToken()});
      _apiResponse = await _generateResponse(res);
    } on SocketException {
      _model.message =
          "No Internet Available.\nPlease check your internet connection & Try Again!";
      _apiResponse = ApiFail(_model);
    } on FormatException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } on HttpException {
      _model.message = "Something went wrong, Please try again.";
      _apiResponse = ApiFail(_model);
    } catch (e) {
      _model.message = "Something went wrong, Our team has been notified";
      _apiResponse = ApiFail(_model);
    }

    return _apiResponse;
  }
  // Future<String> _getUserName() async {
  //   print('---------get User Name----------');
  //   var userModel = LoginModel.fromJson(
  //       jsonDecode(await _secureLocalStorageImpl.read(LocalStorageKey.user)));
  //   if (userModel == null) return "";
  //   return userModel.name.toString();
  // }

  // Future<String> _getUserNumber() async {
  //   print('---------get User Number----------');
  //   var userModel = LoginModel.fromJson(
  //       jsonDecode(await _secureLocalStorageImpl.read(LocalStorageKey.user)));
  //   if (userModel == null) return "";
  //   return userModel.phone.toString();
  // }
}
