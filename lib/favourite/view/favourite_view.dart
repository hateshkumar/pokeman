import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/detial/view/detial_view.dart';
import 'package:pokemon_app/home/view_model/home_view_model.dart';
import 'package:pokemon_app/widgets/add_new_bottom_sheet.dart';
import 'package:pokemon_app/widgets/app_bar.dart';
import 'package:pokemon_app/widgets/app_loader.dart';
import 'package:pokemon_app/widgets/app_spacers.dart';
import 'package:pokemon_app/widgets/decorations.dart';
import 'package:pokemon_app/widgets/text_field.dart';
import 'package:pokemon_app/widgets/text_widget.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked/stacked.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => const FavouriteScreen());
  }

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAAppBar.onlyIcon(context: context,title: "My Favorite"),
      body:Column(
        children: <Widget>[
          PASpacer(height: 5.h,),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PAListItem(index);
                }),
          ),

        ],
      )

    );
  }

  Widget PAListItem(int index) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),

      child: Stack(
        children: [
          Container(
            height: 12.h,
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
              bottom: 10,
            ),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                PASpacer.width(
                  width: 2.w,
                ),
                _getRespectedImage(),
                PASpacer.width(
                  width: 2.w,
                ),
                PAText.text(text: "Item No. $index"),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 2,
            child: Container(
              transform: Matrix4.translationValues(
                0,
                -10,
                0.0,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: APPColors.appRed,
                      shape: BoxShape.circle
                  ),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: APPColors.appWhite,
                      child: Icon(Icons.close, color: APPColors.appRed),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getRespectedImage() {
    return CachedNetworkImage(
      imageUrl: "",
      imageBuilder: (context, imageProvider) => Container(
        height: 60,
        width: 60,
        decoration:
            PADecorations.cicularWithShadowWithImage(image: imageProvider),
      ),
      placeholder: (context, url) => Container(
        height: 60,
        width: 60,
        decoration: PADecorations.cicularWithShadow(),
        child: const CupertinoActivityIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        height: 60,
        width: 60,
        decoration: PADecorations.cicularWithShadow(),
        child: const Icon(Icons.error,color: APPColors.appRed,),
      ),
    );
  }

}

