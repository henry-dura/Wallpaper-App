import 'package:flutter/material.dart';
import 'package:wallpaper/components/carousel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('Wallpapers'),
            TextField(
              cursorHeight: 25,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70),
              decoration: InputDecoration(
                hintText: 'Search wallpaper name',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 45,
                  color: Colors.white70,
                ),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
              ),


            ),
            Text('Favourites'),
            Carousel(),
          ],
        ),
      ),
    );
  }
}
