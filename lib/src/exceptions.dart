import 'package:meta/meta.dart';

class InvalidPageArgumentsException implements Exception {}

class InvalidRouteNameException implements Exception {
  final String routeName;

  InvalidRouteNameException({@required this.routeName});

  @override
  String toString() {
    return 'InvalidRouteNameException { routeName: $routeName }';
  }
}