import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc;

  const Provider(this.bloc, {Key? key, required Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }
}