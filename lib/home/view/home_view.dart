import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/detial/view/detial_view.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => const HomeScreen());
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PAAppBar.onlyIcon(context: context, title: "PokeMons"),
        body: Column(
          children: [
            _Header(searchController: _searchController),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PAListItem(index);
                  }),
            )
          ],
        ));
  }

  Widget PAListItem(int index) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, DetailScreen.route());
      },
      child: Container(
        height: 12.h,
        margin: EdgeInsets.only(
          left: PASpace.horizontal,
          right: PASpace.horizontal,
          top: 2,
          bottom: 2,
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
        child: const Icon(Icons.error),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required TextEditingController searchController})
      : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PASpace.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PAText.headerText(
            text: 'Pokemon Listing',
            color: APPColors.appWhite,
            fontSize: 20.sp,
          ),
          PASpacer(
            height: 3.h,
          ),
          PATextField(
            controller: _searchController,
            hintText: 'Search Pokemon',
            icon: Icons.search,
            borderRadius: 10,
            validator: (String val) async {},
          ),
        ],
      ),
    );
  }
}
