import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
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
  const DetailScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => const DetailScreen());
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PAAppBar.onlyIcon(context: context, title: "PokeMon Detail"),
        body: Column(
          children: [
            PASpacer(height: 5.h,),
            _getRespectedImage(),
            PASpacer(height: 2.h,),
            PAText.text(text: "Name",fontSize: 22.sp,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10.w,top: 5.h),
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return PADetailTypeListItem(index);
                    }),
              ),
            )

          ],
        ));
  }

  Widget PADetailTypeListItem(int index) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 4.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: APPColors.appRed,
          ),
        ),
        PASpacer.width(width: 5,),
        PAText.text(text: "Item No. $index",fontSize: 15.sp,),
      ],
    );
  }



  Widget _getRespectedImage() {
    return CachedNetworkImage(
      imageUrl: "",
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
        child: const Icon(Icons.error),
      ),
    );
  }
}

