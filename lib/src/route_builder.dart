import 'package:flutter/material.dart';
import 'package:route_generator/route_generator.dart';

abstract class RouteBuilder {
  String get routeName;

  bool match(RouteSettings settings) => settings.name == routeName;

  MaterialPageRoute build(RouteSettings settings);
}

abstract class RouteWithoutArgsBuilder extends RouteBuilder {
  Widget pageFactory();

  MaterialPageRoute build(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => pageFactory(),
      settings: RouteSettings(name: routeName),
    );
  }
}

abstract class RouteWithArgsBuilder<Arguments> extends RouteBuilder {
  Widget pageFactory(Arguments args);

  @override
  MaterialPageRoute build(RouteSettings settings) {
    if (settings.arguments is Arguments) {
      return MaterialPageRoute(
        builder: (_) => pageFactory(settings.arguments),
        settings: RouteSettings(name: routeName),
      );
    } else {
      throw InvalidPageArgumentsException();
    }
  }
}
