import 'package:flutter/material.dart';
import 'package:pokemon_app/splash/view/splash_view.dart';


import 'package:sizer/sizer.dart';

import '../app_core.dart';

// ignore: use_key_in_widget_constructors
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: providers,
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: APPColors.appWhite,
            ),
            title: 'PokeMon App',
            home: const SplashScreen(),
          );
        }));
  }
}
