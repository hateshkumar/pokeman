import 'package:flutter/material.dart';

class ENP {
  static const stagingBaseUrl =
      "https://staging-app.matchboxmatrimonial.com/api/v1/auth/";
  static const imageUrl = "https://staging-app.matchboxmatrimonial.com/";
  //  "https://staging.matchboxmatrimonial.com/api/v1/";

  static const baseUrl = stagingBaseUrl;
/////////// ---------------- AUTH Endpoints ---------------- ///////////

  static const getRegisterScreenDropDowns = "auth/getRegisterScreenDropDowns";
  static const packages = "auth/getPackages";
  static const register = "auth/registerStep";
  static const login = "auth/login";
  static const sendOtp = "sendOtp";
  static const verifyOtp = "verifyOtp";
  static const registerStep2 = "auth/registerStep2";

  //////////// ---------------- Event Endpoints ---------------- ///////////
  static const eventDashboard = "event-dashboard";
  static const eventListing = "events-list?q=";
  static const eventDetail = 'event-detail';
  static const participents = 'eventParticipantsLog';

  //////////// ---------------- Profile Endpoints ---------------- ///////////

  static const createProfile = "updateProfile";
  static const getCountries = "getCountries";
  static const getCities = "getCities";

  /////////////---------------  Video Endpoints  ---------------////////////////

  static const joinGroupVideo = "event/joinRoom";
  static const params = "params";

  /////////////---------------  splash Endpoints  ---------------////////////////

  static const forceUpdate = 'forceUpdate';

  /////////////---------------  Payment Endpoints  ---------------////////////////
  static const saleTransaction = 'saleTransaction';
  static const customerTransaction = 'customerSaleTransactions';
}
