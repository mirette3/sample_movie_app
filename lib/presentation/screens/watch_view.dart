import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_movies/core/utiles/app_constants.dart';
import 'package:sample_movies/presentation/screens/movie_view_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wear/wear.dart';

class WatchView extends StatelessWidget {
  const WatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WatchShape(
          builder: (BuildContext context, WearShape shape, Widget? child) {
        return SafeArea(
          child: Consumer<MovieViewModel>(
            builder: (context, viewModel, child) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: shape == WearShape.square
                        ? BoxShape.rectangle
                        : BoxShape.circle),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(5.0),
                  itemCount: viewModel.movies.length,
                  itemBuilder: (context, index) {
                    final movie = viewModel.movies[index];

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: 50.0,
                                fit: BoxFit.cover,
                                imageUrl:
                                    AppConstants.imageUrl(movie.backdropPath),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 30.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),

                          Text(
                            movie.title,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 10, color: Colors.black,),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
