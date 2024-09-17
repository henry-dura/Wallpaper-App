import 'package:flutter/material.dart';
import 'package:wallpaper/presentation/components/grid_view.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          bottom: const TabBar(
            // isScrollable: true
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            // indicatorSize: TabBarIndicatorSize.values,
            tabs: <Widget>[
              Tab(text: 'Nature'),
              Tab(text: 'Tigers'),
              Tab(text: 'People'),

            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: TabBarView( children:[
            WallPaperGrid(category: 'Nature'),
            WallPaperGrid(category: 'Tigers'),
            WallPaperGrid(category: 'People')

          ]),
        ),
      ),
    );
  }
}
