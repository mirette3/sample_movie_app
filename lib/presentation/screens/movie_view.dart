import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_movies/core/utiles/app_constants.dart';
import 'package:sample_movies/presentation/screens/movies_view_model.dart';
import 'package:shimmer/shimmer.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=>MovieViewModel()..getPopularData(),
      child: Consumer<MovieViewModel>(
        builder: (context,viewModel,child){
          return Scaffold(
            body: SafeArea(
              child: ListView.builder(
                shrinkWrap: true,
                 physics: const BouncingScrollPhysics(),
                padding:  const EdgeInsets.all( 10.0),
                itemCount:viewModel.movies.length ,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 100.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstants.imageUrl( viewModel.movies[index].backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
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
                      const SizedBox(width: 10,),
                      Text(viewModel.movies[index].title,style: const TextStyle(fontSize: 20,color: Colors.black),)],),
                  );
                },
              ),
            ),);
        }
      ),
    );
  }
}
