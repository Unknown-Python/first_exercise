import 'package:flutter_test/flutter_test.dart';
import 'package:first_exercise/movie.dart';

void main() {
  final testJson = {
    'Title': 'Avatar',
    'Year': '2009',
    'Rated': 'PG-13',
    'Released': '18 Dec 2009',
    'Runtime': '162 min',
    'Genre': 'Action, Adventure, Fantasy',
    'Director': 'James Cameron',
    'Writer': 'James Cameron',
    'Actors': 'Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang',
    'Plot': 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.',
    'Language': 'English, Spanish',
    'Country': 'USA, UK',
    'Awards': 'Won 3 Oscars. Another 80 wins & 121 nominations.',
    'Poster': 'http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg',
    'Metascore': '83',
    'imdbRating': '7.9',
    'imdbVotes': '890,617',
    'imdbID': 'tt0499549',
    'Type': 'movie',
    'Images': [
      'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
      'https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
      'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
      'https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
      'https://images-na.ssl-images-amazon.com/images/M/MV5BMTYxMDg1Nzk1MV5BMl5BanBnXkFtZTcwMDk0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
    ],
  };

  test('Movie.fromJson creates correct Movie', () {
    final movie = Movie.fromJson(testJson);

    expect(movie.title, 'Avatar');
    expect(movie.year, '2009');
    expect(movie.rated, 'PG-13');
    expect(movie.released, '18 Dec 2009');
    expect(movie.runtime, '162 min');
    expect(movie.genre, 'Action, Adventure, Fantasy');
    expect(movie.director, 'James Cameron');
    expect(movie.writer, 'James Cameron');
    expect(movie.actors, 'Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang');
    expect(movie.language, 'English, Spanish');
    expect(movie.country, 'USA, UK');
    expect(movie.awards, 'Won 3 Oscars. Another 80 wins & 121 nominations.');
    expect(movie.metascore, '83');
    expect(movie.imdbRating, '7.9');
    expect(movie.imdbVotes, '890,617');
    expect(movie.imdbID, 'tt0499549');
    expect(movie.type, 'movie');
    expect(movie.images.length, 5);
    expect(movie.images[0], 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg');
  });

  test('Movie.toJson returns correct Map', () {
    final movie = Movie.fromJson(testJson);
    final json = movie.toJson();

    expect(json['Title'], 'Avatar');
    expect(json['Year'], '2009');
    expect(json['Rated'], 'PG-13');
    expect(json['Released'], '18 Dec 2009');
    expect(json['Runtime'], '162 min');
    expect(json['Genre'], 'Action, Adventure, Fantasy');
    expect(json['Director'], 'James Cameron');
    expect(json['Writer'], 'James Cameron');
    expect(json['Actors'], 'Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang');
    expect(json['Language'], 'English, Spanish');
    expect(json['Country'], 'USA, UK');
    expect(json['Awards'], 'Won 3 Oscars. Another 80 wins & 121 nominations.');
    expect(json['Metascore'], '83');
    expect(json['imdbRating'], '7.9');
    expect(json['imdbVotes'], '890,617');
    expect(json['imdbID'], 'tt0499549');
    expect(json['Type'], 'movie');
    expect(json['Images'], isA<List>());
    expect(json['Images'].length, 5);
  });
}
