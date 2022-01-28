import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/detial/services/detail_service.dart';
import 'package:pokemon_app/favourite/services/Favorite_service.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
import 'package:pokemon_app/home/models/pokemon_model.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends BaseViewModel {
  FavoriteViewModel({FavoriteService? favoriteService})
      : favoriteService = favoriteService ?? FavoriteService();
  final FavoriteService? favoriteService;
  bool? _isFavorite = false;
  List<PokemonFavoriteModel>? _list;


  List<PokemonFavoriteModel>? get list => _list;

  set list(List<PokemonFavoriteModel>? value) {
    _list = value;
    notifyListeners();
  }

  bool? get isFavorite => _isFavorite;

  set isFavorite(bool? value) {
    _isFavorite = value;
    notifyListeners();
  }

  void modifyFavorite(PokemonDetailModel detailModel,bool isAdd) {
   if(isAdd){
     addFavorite(detailModel);
   }else {
     removeFavorite(detailModel.id.toString());
   }
  }

  void getFavorite() {
    setBusy(true);
     favoriteService!.getFavorite().then((value){
       list = value;
       setBusy(false);
       notifyListeners();
     });
  }
  void addFavorite(PokemonDetailModel detailModel) {
    favoriteService?.addFavorite(detailModel).then((value){
      print(value);
      if(value!=0) {
        isFavorite =true;
      }
    });
  }

  void removeFavorite(String id) {
    favoriteService?.removeFavorite(id);
    isFavorite =false;
    getFavorite();
  }

  void checkIfFavorite(String id) {
    favoriteService!.checkIfFavorite(id).then((value){
      print(value);
      if(value){
        isFavorite = true;
      }
    });
  }
}
