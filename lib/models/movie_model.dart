import 'package:flutter/foundation.dart';

class Movie {
  final String id;
  final String name;
  final String directorName;
  final String poster;

  Movie({
    @required this.id,
    @required this.name,
    @required this.directorName,
    @required this.poster,
  });
}
