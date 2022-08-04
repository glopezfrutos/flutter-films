import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widget/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Películas en cines"),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.moviesNowPlaying),
            // Slider de películas
            MovieSlider(
              title: "Popular",
              movies: moviesProvider.moviesPopular,
              onNextPage: () => moviesProvider.getMoviesPopular(),
            ),
          ]),
        ));
  }
}
