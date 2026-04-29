import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_exercise/main.dart';
import 'package:first_exercise/movie.dart';

List<Movie> _loadMoviesFromAsset() {
  final raw = File('movie_data.json').readAsStringSync();
  final list = jsonDecode(raw) as List;
  return list
      .map((m) => Movie.fromJson(m as Map<String, dynamic>))
      .toList();
}

// Image.network requests in the detail screen always fail with HTTP 400
// inside flutter_test (the test binding blocks real network access).
// Drain those expected NetworkImageLoadExceptions so they don't fail the test.
void _ignoreNetworkImageErrors(WidgetTester tester) {
  while (tester.takeException() != null) {}
}

Widget _appWith(List<Movie> movies) => MaterialApp(
  home: MyHomePage(
    title: 'Movies',
    movieUri: 'unused-in-test',
    movieLoader: () async => movies,
  ),
);

void main() {
  final movies = _loadMoviesFromAsset();
  final first = movies.first;
  final second = movies[1];

  testWidgets(
    'Tapping a movie pushes the detail screen with that movie',
    (tester) async {
      await tester.pumpWidget(_appWith(movies));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.text('Movies'), findsOneWidget);
      expect(find.text(first.title), findsWidgets);
      expect(find.text('Movie Details'), findsNothing);

      await tester.tap(find.text(first.title).first);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Movie Details'), findsOneWidget);
      expect(find.text(first.title), findsOneWidget);
      expect(find.text(first.plot), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.bar_chart), findsOneWidget);

      _ignoreNetworkImageErrors(tester);
    },
  );

  testWidgets('Back arrow returns to the main list', (tester) async {
    await tester.pumpWidget(_appWith(movies));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    await tester.tap(find.text(first.title).first);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Movie Details'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Movie Details'), findsNothing);
    expect(find.byType(TextField), findsOneWidget);

    _ignoreNetworkImageErrors(tester);
  });

  testWidgets(
    'Detail screen shows the tapped movie, not a different one',
    (tester) async {
      await tester.pumpWidget(_appWith(movies));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));

      await tester.tap(find.text(second.title).first);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text(second.title), findsOneWidget);
      expect(find.text(first.title), findsNothing);

      _ignoreNetworkImageErrors(tester);
    },
  );
}
