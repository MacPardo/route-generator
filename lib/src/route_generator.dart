import 'package:flutter/material.dart';
import 'package:route_generator/route_generator.dart';

class RouteGenerator {
  final List<RouteBuilder> routes;

  RouteGenerator(this.routes);

  Route<dynamic> generateRoute(RouteSettings settings) {
    for (int i = 0; i < routes.length; i++) {
      if (routes[i].match(settings)) {
        return routes[i].build(settings);
      }
    }

    throw InvalidRouteNameException(routeName: settings.name);
  }
}
