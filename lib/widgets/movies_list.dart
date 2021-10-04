import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import 'movie_Item.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  final Function deleteMovie;

  MoviesList(this.movies, this.deleteMovie);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: movies.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'No Movies Have Been Added Yet!',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : MovieItem(movies: movies, deleteMovie: deleteMovie),
      ),
    );
  }
}
