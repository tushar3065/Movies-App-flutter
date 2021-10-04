import 'package:flutter/material.dart';

import '/models/movie_model.dart';
import '/screens/add_movies.screen.dart';
import '/widgets/movies_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Movie> _userMovies = [
    Movie(
        id: 'c1',
        name: '3 Idiots',
        directorName: 'Rajkumar Hirani',
        poster:
            'https://upload.wikimedia.org/wikipedia/en/thumb/d/df/3_idiots_poster.jpg/220px-3_idiots_poster.jpg'),
    Movie(
        id: 'c2',
        name: 'Bell Bottom',
        directorName: 'Ranjit M Tewari',
        poster:
            'https://upload.wikimedia.org/wikipedia/en/thumb/2/21/Bell_Bottom_film_Poster.jpg/220px-Bell_Bottom_film_Poster.jpg'),
    Movie(
        id: 'c3',
        name: 'Haseen Dillruba',
        directorName: 'Vinil Mathew',
        poster:
            'https://upload.wikimedia.org/wikipedia/en/3/30/Haseen_Dillruba_film_poster.jpg'),
    Movie(
        id: 'c4',
        name: 'Mimi',
        directorName: 'Laxman Utekar',
        poster:
            'https://upload.wikimedia.org/wikipedia/en/thumb/f/f4/Mimi_2021_Hindi_poster.jpg/220px-Mimi_2021_Hindi_poster.jpg')
  ];

  void _addNewMovie(String movieTitle, String posterUrl, String director) {
    final newMovie = Movie(
      name: movieTitle,
      poster: posterUrl,
      directorName: director,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userMovies.add(newMovie);
    });
  }

  void _deleteMovie(String id) {
    setState(() {
      _userMovies.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Watchlist',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MoviesList(_userMovies, _deleteMovie),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMovie(_addNewMovie)),
        ),
      ),
    );
  }
}
