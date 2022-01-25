part of 'api_states.dart';

class ApiModel {
  late bool _success;
  late bool _code;
  late String _message;
  dynamic _status;
  dynamic _data;
  // ignore: unnecessary_getters_setters
  bool get code => _code;
  // ignore: unnecessary_getters_setters
  set code(bool value) {
    _code = value;
  }

  // ignore: unnecessary_getters_setters
  dynamic get status => _status;
  // ignore: unnecessary_getters_setters
  set status(dynamic value) {
    _status = value;
  }

  // ignore: unnecessary_getters_setters
  dynamic get data => _data;
  // ignore: unnecessary_getters_setters
  set data(dynamic value) {
    _data = value;
  }

  // ignore: unnecessary_getters_setters
  bool get success => _success;
  // ignore: unnecessary_getters_setters
  set success(bool value) {
    _success = value;
  }

  // ignore: unnecessary_getters_setters
  String get message => _message;
  // ignore: unnecessary_getters_setters
  set message(String value) {
    _message = value;
  }
}
