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
  List<PokemonDetailModel>? pokemonDetailList = [];

  List<PokemonDetailModel>? get pokemonDetail => _pokemonDetail;


  set pokemonDetail(List<PokemonDetailModel>? value) {
    _pokemonDetail = value;
    notifyListeners();
  }

  void get getPokemonList async {
    setInitialised(true);
    ApiResponse res = await _homeService!.getPokemonList;
    if (res is ApiSuccess) {
      _pokemonList = PokemonModel.fromJson(res.apiModel.data).results;

      _pokemonList?.forEach((element) async {
        getPokemonDetail(element.url!)
            .then((value) {
          pokemonDetailList?.add(value);
          pokemonDetail = pokemonDetailList;
          notifyListeners();
        });

      });
    } else if (res is ApiFail) {
      setInitialised(false);
      setError(res.apiModel.message);
    }
    setInitialised(false);

  }

  Future<PokemonDetailModel> getPokemonDetail(String url) async {
    ApiResponse res = await _homeService!.getPokemonDetail(url: url);
    return PokemonDetailModel.fromJson(res.apiModel?.data);
  }
}
