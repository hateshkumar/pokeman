import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
import 'package:pokemon_app/home/models/pokemon_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({HomeService? homeService})
      : _homeService = homeService ?? HomeService();
  final HomeService? _homeService;
  List<PokemonListResults>? _pokemonList;
  List<PokemonDetailModel>? _pokemonDetail;


  List<PokemonDetailModel>?get pokemonDetail => _pokemonDetail;


  void get getPokemonList async {
    setInitialised(true);
    ApiResponse res = await _homeService!.getPokemonList;
    if (res is ApiSuccess) {
      _pokemonList = PokemonModel.fromJson(res.apiModel.data).results;
      _pokemonList?.forEach((element) {
        getPokemonDetail(element.url!);
      });
    } else if (res is ApiFail) {
      setInitialised(false);

      setError(res.apiModel.message);
    }
  }

  Future<ApiResponse> getPokemonDetail(String url) async {
    ApiResponse res = await _homeService!.getPokemonDetail(url: url);
    if (res is ApiSuccess) {
      _pokemonDetail?.add(PokemonDetailModel.fromJson(res.apiModel.data));
    } else if (res is ApiFail) {
      setError(res.apiModel.message);
    }
    setInitialised(false);

    notifyListeners();
    return res;
  }
}
