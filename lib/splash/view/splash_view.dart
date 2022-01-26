import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_constants/app_colors.dart';
import 'package:pokemon_app/app_core/app_constants/asset_path.dart';
import 'package:pokemon_app/home/view/home_view.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, HomeScreen.route());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: APPColors.appWhite,
        body: Center(
          child: Image.asset(
            bgSplash,
            width: 80.w,
            height: 20.h,
          ),
        ));
  }
}
