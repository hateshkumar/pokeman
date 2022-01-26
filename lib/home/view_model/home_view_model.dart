
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({HomeService? homeService})
      : _homeService = homeService ?? HomeService();
  final HomeService? _homeService;



}
