class MoviesCollection {
  List<SearchMovie>? searchMovie;
  String? totalResults;
  String? response;

  MoviesCollection({this.searchMovie, this.totalResults, this.response});

  MoviesCollection.fromJson(Map<String, dynamic> json) {
    searchMovie = <SearchMovie>[];
    json['Search'].forEach((v) {
      searchMovie!.add(SearchMovie.fromJson(v));
    });

    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchMovie != null) {
      data['Search'] = this.searchMovie!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class SearchMovie {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  SearchMovie({this.title, this.year, this.imdbID, this.type, this.poster});

  SearchMovie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
