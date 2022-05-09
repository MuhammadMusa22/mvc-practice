import 'package:flutter/material.dart';
import 'package:mvc_practice/controllers/movie_api.dart';
import 'package:mvc_practice/models/movie.dart';
import 'package:mvc_practice/utils/app_strings.dart';
import 'package:mvc_practice/views/custom_widgets/text_row.dart';

class MovieDetails extends StatefulWidget {
  final String? movieName;

  MovieDetails({this.movieName});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Movie? movie;
  MovieApi api = MovieApi();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies();
  }

  // fetch details about the movie through the name of the movie, passed into this class from Home class/
  void fetchMovies() async {
    try {
      setState(() => _isLoading = true);
      //get response from controller class through api call, passing that name
      final response = await api.getMovieInfo(widget.movieName!);

      setState(() {
        _isLoading = false;
        movie = response;
      });
    } catch (e) {
      setState(() {
        movie = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.movieDetailsBarTitle),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  height: 300.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie!.poster!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextRow(
                  title1: AppStrings.title,
                  titleDetails1: movie!.title,
                  title2: AppStrings.releasedDate,
                  titleDetails2: movie!.released,
                ),
                TextRow(
                  title1: AppStrings.imdbRating,
                  titleDetails1: movie!.imdbRating,
                  title2: AppStrings.movieLength,
                  titleDetails2: movie!.runtime,
                ),
                TextRow(
                  title1: AppStrings.type,
                  titleDetails1: movie!.type,
                  title2: AppStrings.boxOffice,
                  titleDetails2: movie!.boxOffice,
                ),
                TextRow(
                  title1: AppStrings.language,
                  titleDetails1: movie!.language,
                  title2: AppStrings.language,
                  titleDetails2: movie!.director,
                ),
              ],
            ),
    );
  }
}
