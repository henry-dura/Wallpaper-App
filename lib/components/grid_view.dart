import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallPaperGrid extends StatelessWidget {
  const WallPaperGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),  // Large tile spanning 2x2
            const QuiltedGridTile(1, 1),  // Small tile 1x1
            const QuiltedGridTile(1, 1),  // Small tile 1x1
            const QuiltedGridTile(1, 2),  // Large tile spanning 1x2
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              'Drinking $index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          childCount: 20,  // Number of items in the grid
        ),
      ),
    );
  }
}
