import 'package:flutter/material.dart';
import 'package:sample_movies/presentation/screens/movie_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popular Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieView(),
    );
  }
}
