import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
import 'package:pokemon_app/home/view_model/home_view_model.dart';
import 'package:pokemon_app/widgets/app_bar.dart';
import 'package:pokemon_app/widgets/app_loader.dart';
import 'package:pokemon_app/widgets/app_spacers.dart';
import 'package:pokemon_app/widgets/decorations.dart';
import 'package:pokemon_app/widgets/text_field.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class DetailScreen extends StatefulWidget {

  PokemonDetailModel? pokemonDetailModel;
  static Route route(PokemonDetailModel? pokemonDetailModel) {
    return MaterialPageRoute<void>(builder: (context) =>  DetailScreen(pokemonDetailModel));
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();

  DetailScreen(this.pokemonDetailModel);
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PAAppBar.onlyIcon(context: context, title: "PokeMon Detail"),
        body: Column(
          children: [
            PASpacer(height: 5.h,),
            _getRespectedImage(widget.pokemonDetailModel?.sprites?.other?.home?.frontShiny),
            PASpacer(height: 2.h,),
            Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PAText.text(text: widget.pokemonDetailModel!.name.toString(),fontSize: 22.sp,),
                  PASpacer.width(width: 2,),
                  const Align(
                      alignment: Alignment.topRight ,
                      child: Icon(Icons.favorite_border_rounded,color: APPColors.appRed,))
                ],
              ),
            )
            ,
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.w,top: 2.h),
                child: ListView.builder(
                    itemCount: widget.pokemonDetailModel!.types!.length,
                    itemBuilder: (context, index) {
                      return PADetailTypeListItem(index,widget.pokemonDetailModel!.types![index]);
                    }),
              ),
            )

          ],
        ));
  }

  Widget PADetailTypeListItem(int index, Types types) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 3.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: APPColors.appRed,
          ),
        ),
        PASpacer.width(width: 5,),
        PAText.text(text: types.type!.name! ,fontSize: 13.sp,),
      ],
    );
  }



  Widget _getRespectedImage(String? frontShiny) {
    print(frontShiny);
    return CachedNetworkImage(
      imageUrl: frontShiny!,
      imageBuilder: (context, imageProvider) => Container(
        height: 120,
        width: 120,
        decoration:
        PADecorations.cicularWithShadowWithImage(image: imageProvider),
      ),
      placeholder: (context, url) => Container(
        height: 120,
        width: 120,
        decoration: PADecorations.cicularWithShadow(),
        child: const CupertinoActivityIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        height: 120,
        width: 120,
        decoration: PADecorations.cicularWithShadow(),
        child: const Icon(Icons.error,color: APPColors.appRed,),
      ),
    );
  }
}

