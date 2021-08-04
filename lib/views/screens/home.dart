import 'package:flutter/material.dart';
import 'package:mvc_practice/controllers/movie_api.dart';
import 'package:mvc_practice/models/movies_collection.dart';
import 'package:mvc_practice/utils/app_strings.dart';
import 'package:mvc_practice/views/screens/movie_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MoviesCollection? moviesCollection;
  MovieApi api = MovieApi();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      setState(() => _isLoading = true);
      //fetch list of movies from controller class which has API client methods, to get data in json and parse that data.
      final response = await api.getAllMovies();

      setState(() {
        _isLoading = false;
        moviesCollection = response;
      });
    } catch (e) {
      setState(() {
        moviesCollection = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.movieListsBarTitle),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: moviesCollection!.searchMovie!.length,
              itemBuilder: (context, index) {
                SearchMovie movie = moviesCollection!.searchMovie![index];
                return ListTile(
                  onTap: () {
                    showMovieDetails(movie.title!);
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(movie.poster!),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(movie.title!),
                  subtitle: Text(movie.year!),
                );
              }),
    );
  }

  void showMovieDetails(String movieTitle) {
    //pass the title of the movie to move detail screen which can pass that title to api class for
    //fetching exact movie details
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetails(
                  movieName: movieTitle,
                )));
  }
}
