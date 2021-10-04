import 'package:flutter/material.dart';

import '/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key key,
    @required this.movies,
    @required this.deleteMovie,
  }) : super(key: key);

  final List<Movie> movies;
  final Function deleteMovie;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Image.network(
                  movies[index].poster,
                  height: 150,
                  width: 110,
                  fit: BoxFit.fill,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies[index].name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          movies[index].directorName,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Text('Alert'),
                                content:
                                    Text('Are you Sure you want to delete?'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        deleteMovie(movies[index].id);
                                        Navigator.pop(context);
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Movie Deleted',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.blueGrey,
                                          elevation: 3,
                                          behavior: SnackBarBehavior.fixed,
                                        ));
                                      },
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('No',
                                          style: TextStyle(fontSize: 18))),
                                ],
                              ));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ))
              ],
            ),
          ),
        );
      },
      itemCount: movies.length,
    );
  }
}
