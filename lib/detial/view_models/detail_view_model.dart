import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/detial/services/detail_service.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
import 'package:pokemon_app/home/models/pokemon_model.dart';
import 'package:stacked/stacked.dart';

class DetailViewModel extends BaseViewModel {
  DetailViewModel({DetailService? detailService})
      : detailService = detailService ?? DetailService();
  final DetailService? detailService;
  bool? _isFavorite = false;


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


  void addFavorite(PokemonDetailModel detailModel) {
    detailService?.addFavorite(detailModel).then((value){
      print(value);
      if(value!=0) {
        isFavorite =true;
      }
    });
  }

  void removeFavorite(String id) {
    detailService?.removeFavorite(id);
    isFavorite =false;
  }

  void checkIfFavorite(String id) {
    detailService!.checkIfFavorite(id).then((value){
      print(value);
      if(value){
        isFavorite = true;
      }
    });
  }
}
