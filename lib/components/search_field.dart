import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 25,
      style: const TextStyle(
        // fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white70),
      decoration: InputDecoration(
        hintText: 'Search wallpaper name',
        hintStyle: const TextStyle(color: Colors.white70),
        suffixIcon: const Icon(
          Icons.search,
          size: 30,
          color: Colors.white70,
        ),
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),


    );
  }
}
