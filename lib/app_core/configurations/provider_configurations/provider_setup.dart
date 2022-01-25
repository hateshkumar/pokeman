
import 'package:pokemon_app/app_core/configurations/api_configurations/api.dart';
import 'package:pokemon_app/home/services/home_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...homeServices,
];


/* Home Service */
List<SingleChildWidget> homeServices = [
  ChangeNotifierProxyProvider<Api, HomeService>(
    create: (_) => HomeService(),
    update: (context, api, callService) => callService!..update(api),
  ),
];
