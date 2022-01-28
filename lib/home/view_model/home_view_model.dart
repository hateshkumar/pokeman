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
  List<PokemonDetailModel>? _searchList;

  List<PokemonDetailModel>? get searchList => _searchList;

  set searchList(List<PokemonDetailModel>? value) {
    _searchList = value;
    notifyListeners();
  }

  List<PokemonDetailModel>? pokemonDetailList = [];
  String? _nextUrl = ENP.baseUrl+ENP.pokemonList;


  String? get nextUrl => _nextUrl;

  bool? _pagination = false;
  bool? _isSearchFound = true;


  bool? get isSearchFound => _isSearchFound;

  set isSearchFound(bool? value) {
    _isSearchFound = value;
    notifyListeners();
  }

  bool? get pagination => _pagination;

  set pagination(bool? value) {
    _pagination = value;
    notifyListeners();
  }

  set nextUrl(String? value) {
    _nextUrl = value;
    notifyListeners();
  }

  List<PokemonDetailModel>? get pokemonDetail => _pokemonDetail;


  set pokemonDetail(List<PokemonDetailModel>? value) {
    _pokemonDetail = value;
    searchList = value;
    notifyListeners();
  }

  void get getPokemonList async {
    setInitialised(true);
    ApiResponse res = await _homeService!.getPokemonList(nextUrl!);
    if (res is ApiSuccess) {
      nextUrl = PokemonModel.fromJson(res.apiModel.data).next;
      _pokemonList = PokemonModel.fromJson(res.apiModel.data).results;
      _pokemonList?.forEach((element) async {
        getPokemonDetail(element.url!)
            .then((value) {
          pokemonDetailList?.add(value);
          pokemonDetail = pokemonDetailList;
          setInitialised(false);

          notifyListeners();
        });

      });
    } else if (res is ApiFail) {
      setInitialised(false);
      setBusy(false);
      pagination = false;
      setError(res.apiModel.message);
    }
    notifyListeners();

  }



  void get getPokemonListpaginationData async {
    pagination = true;
    ApiResponse res = await _homeService!.getPokemonList(nextUrl!);
    if (res is ApiSuccess) {
      nextUrl = PokemonModel.fromJson(res.apiModel.data).next;
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
      setError(res.apiModel.message);
    }
    pagination = false;
    notifyListeners();

  }


  Future<PokemonDetailModel> getPokemonDetail(String url) async {
    ApiResponse res = await _homeService!.getPokemonDetail(url: url);
    return PokemonDetailModel.fromJson(res.apiModel?.data);
  }

  void searchPokemon(String nameId){
    setInitialised(true);
     searchList = _pokemonDetail?.where((e) => e.name!.contains(nameId) || e.name!.startsWith(nameId) ||
        e.id.toString().contains(nameId) || e.id.toString().startsWith(nameId)).toList();
     if(searchList!.isEmpty) {
       searchList = _pokemonDetail;
       _isSearchFound = false;
       notifyListeners();
     }else{
       _isSearchFound = true;

     }
    setInitialised(false);
    notifyListeners();

  }

  void resetSearch() {
    searchList = pokemonDetail;
    notifyListeners();
  }
}
