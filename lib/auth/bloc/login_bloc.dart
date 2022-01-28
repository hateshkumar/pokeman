import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';


import 'package:rxdart/rxdart.dart';
import 'package:string_validator/string_validator.dart';

class LoginBloc {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();


  //set
  Function(String) get changeEmailAddressDetail => _email.sink.add;
  Function(String) get changePasswordDateDetail => _password.sink.add;
  //get

  Stream<String> get emailAddressDetail =>
      _email.stream.transform(vaildateEmailAddress);

  Stream<String> get passwordDetail => _password.stream.transform(vaildatePass);

  Stream<bool> get loginValidate =>
      Rx.combineLatest2(emailAddressDetail, passwordDetail, (phoneDetail, a) => true);


  void dispose() {
    _email.close();
    _password.close();
  }


  final vaildatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length <3 ) {
      sink.addError('Please enter a valid Password');
    } else {
      sink.add(password);
    }
  });
  final vaildateEmailAddress = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailAddress, sink) {
    if (!isEmail(emailAddress)) {
      sink.addError('Please enter a valid email address');
    } else {
      sink.add(emailAddress);
    }
  });

  //methods


}
