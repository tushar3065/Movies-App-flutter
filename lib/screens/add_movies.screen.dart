import 'package:flutter/material.dart';

class AddMovie extends StatefulWidget {
  static const routeName = '/edit-screen';

  final Function addMovie;
  AddMovie(this.addMovie);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _formData {
  String name = '';
  String directorName = '';
  String posterUrl = '';
}

class _AddMovieState extends State<AddMovie> {
  final _form = GlobalKey<FormState>();
  _formData _data = _formData();

  void submit() {
    _form.currentState.save();

    final enteredTitle = _data.name;
    final enteredUrl = _data.posterUrl;
    final enteredName = _data.directorName;

    widget.addMovie(
      enteredTitle,
      enteredUrl,
      enteredName,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Movies'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Movie Name',
                ),
                onSaved: (String value) {
                  this._data.name = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Director Name',
                ),
                onSaved: (String value) {
                  this._data.directorName = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelText: 'Enter Poster Url',
                ),
                onSaved: (String value) {
                  this._data.posterUrl = value;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: ElevatedButton(
                    child: Text(
                      'Add Movie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => submit()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
