class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final List<String> images;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String,
      year: json['Year'] as String,
      rated: json['Rated'] as String,
      released: json['Released'] as String,
      runtime: json['Runtime'] as String,
      genre: json['Genre'] as String,
      director: json['Director'] as String,
      writer: json['Writer'] as String,
      actors: json['Actors'] as String,
      plot: json['Plot'] as String,
      language: json['Language'] as String,
      country: json['Country'] as String,
      awards: json['Awards'] as String,
      poster: json['Poster'] as String,
      metascore: json['Metascore'] as String,
      imdbRating: json['imdbRating'] as String,
      imdbVotes: json['imdbVotes'] as String,
      imdbID: json['imdbID'] as String,
      type: json['Type'] as String,
      images: List<String>.from(json['Images']),
    );
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      year: map['year'] as String,
      rated: map['rated'] as String,
      released: map['released'] as String,
      runtime: map['runtime'] as String,
      genre: map['genre'] as String,
      director: map['director'] as String,
      writer: map['writer'] as String,
      actors: map['actors'] as String,
      plot: map['plot'] as String,
      language: map['language'] as String,
      country: map['country'] as String,
      awards: map['awards'] as String,
      poster: map['poster'] as String,
      metascore: map['metascore'] as String,
      imdbRating: map['imdbRating'] as String,
      imdbVotes: map['imdbVotes'] as String,
      imdbID: map['imdbID'] as String,
      type: map['type'] as String,
      images: (map['images'] as String).split(','),
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'year': year,
    'rated': rated,
    'released': released,
    'runtime': runtime,
    'genre': genre,
    'director': director,
    'writer': writer,
    'actors': actors,
    'plot': plot,
    'language': language,
    'country': country,
    'awards': awards,
    'poster': poster,
    'metascore': metascore,
    'imdbRating': imdbRating,
    'imdbVotes': imdbVotes,
    'imdbID': imdbID,
    'type': type,
    'images': images.join(','),
  };

  Map<String, dynamic> toJson() => {
    'Title': title,
    'Year': year,
    'Rated': rated,
    'Released': released,
    'Runtime': runtime,
    'Genre': genre,
    'Director': director,
    'Writer': writer,
    'Actors': actors,
    'Plot': plot,
    'Language': language,
    'Country': country,
    'Awards': awards,
    'Poster': poster,
    'Metascore': metascore,
    'imdbRating': imdbRating,
    'imdbVotes': imdbVotes,
    'imdbID': imdbID,
    'Type': type,
    'Images': images,
  };
}
