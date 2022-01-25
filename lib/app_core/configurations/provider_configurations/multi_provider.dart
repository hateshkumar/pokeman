import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiRepositoryProvider extends MultiProvider {
  MultiRepositoryProvider({
    Key? key,
    required List<SingleChildWidget> providers,
    required Widget child,
  }) : super(key: key, providers: providers, child: child);
}
