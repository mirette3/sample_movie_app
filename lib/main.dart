import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_movies/presentation/screens/movie_view_model.dart';
import 'package:sample_movies/presentation/screens/responsive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieViewModel()..init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Popular Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ResponsiveScreen(),
      ),
    );
  }
}
