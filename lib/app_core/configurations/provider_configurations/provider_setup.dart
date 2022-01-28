
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/app_core/repositories/user/user_bloc.dart';
import 'package:pokemon_app/auth/bloc/login_bloc.dart';
import 'package:pokemon_app/detial/services/detail_service.dart';
import 'package:pokemon_app/favourite/services/Favorite_service.dart';
import 'package:pokemon_app/home/services/home_service.dart';
import 'package:pokemon_app/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...apis,
  ...homeServices,
  ...detailServices,
  ...favoriteServices
];

//apis
List<SingleChildWidget> apis = [
  Provider<Api>.value(value: Api()),
  Provider<AuthBloc>.value(value: AuthBloc()),
  Provider<LoginBloc>.value(value: LoginBloc()),

];

/* Home Service */

List<SingleChildWidget> homeServices = [
  ChangeNotifierProxyProvider<Api,  HomeService>(
    create: (_) => HomeService(),
    update: (context, api, profileService) =>
    profileService!..update(api),
  ),
];
List<SingleChildWidget> detailServices = [
  ChangeNotifierProxyProvider< AuthBloc, DetailService>(
    create: (_) => DetailService(),
    update: (context,  authBloc, detailService) =>
    detailService!..update( authBloc),
  ),
];

List<SingleChildWidget> favoriteServices = [
  ChangeNotifierProxyProvider< AuthBloc, FavoriteService>(
    create: (_) => FavoriteService(),
    update: (context,  authBloc, favoriteService) =>
    favoriteService!..update( authBloc),
  ),
];
