import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app_core/app_core.dart';
import 'package:pokemon_app/detial/view/detial_view.dart';
import 'package:pokemon_app/favourite/view/favourite_view.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
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
  var _isVisible;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late ScrollController _hideButtonController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      _hideButtonController.position.isScrollingNotifier.addListener(() {
        if (!_hideButtonController.position.isScrollingNotifier.value) {
          setState(() {
            _isVisible = true;
          });
        } else {
          setState(() {
            _isVisible = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () =>
              HomeViewModel(homeService: context.watch<HomeService>()),
          onModelReady: (model) {
            model.getPokemonList;
          },
          builder: (context, homeViewModel, child) {
            return Column(
              children: [
                PAAppBarWithout(
                  title: "PokeMons",
                  onPressed: () {
                    Navigator.push(context, FavouriteScreen.route());
                  },
                ),
                _Header(searchController: _searchController),
                Expanded(
                  child: ListView.builder(
                      controller: _hideButtonController,
                      itemCount: homeViewModel.pokemonDetail?.length,
                      itemBuilder: (context, index) {
                        var pokemonDetailModel = homeViewModel.pokemonDetail?[index];
                        return PAListItem(index,pokemonDetailModel);
                      }),
                )
              ],
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 7,
                    right: MediaQuery.of(context).size.height / 7),
                width: 40.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: APPColors.appRed,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[600]!,
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    openBottomSheet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }

  Widget PAListItem(int index, PokemonDetailModel? pokemonDetailModel) {
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
            _getRespectedImage(pokemonDetailModel?.sprites?.other?.home?.frontShiny),
            PASpacer.width(
              width: 2.w,
            ),
            PAText.text(text: "${pokemonDetailModel?.name}"),
          ],
        ),
      ),
    );
  }

  Widget _getRespectedImage(String? imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
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
        child: const Icon(
          Icons.error,
          color: APPColors.appRed,
        ),
      ),
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        backgroundColor: Colors.white,
        context: _scaffoldKey.currentContext!,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: AddNewBottomSheet(),
            ),
          );
        });
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
