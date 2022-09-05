import 'package:flutter/material.dart';
import 'package:sample_movies/presentation/screens/movie_view.dart';
import 'package:sample_movies/presentation/screens/watch_view.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(BuildContext context, BoxConstraints constraints) {
      debugPrint('Host device screen width: ${constraints.maxWidth}');

      // Watch-sized device
      if (constraints.maxWidth < 300) {
        return const WatchView();
      }
      // Phone-sized device
      else {
        return const MovieView();
      }
    });
  }
}
