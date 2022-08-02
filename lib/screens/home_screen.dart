import 'package:flutter/material.dart';
import 'package:peliculas/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            CardSwiper(),
            // Slider de películas
            MovieSlider(),
          ]),
        ));
  }
}
