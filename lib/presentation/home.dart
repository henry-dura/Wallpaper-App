import 'package:flutter/material.dart';
import 'components/tabBar_view.dart';
import 'components/carousel.dart';
import 'components/search_field.dart';




class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return   const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text('Wallpapers',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.red),),
              SearchField(),
              Text('My Favourites',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              CustomCarousel(),
              // SizedBox(height: 10,),
              // SizedBox(
              //   height: 25,
              //   child: TabBar(
              //     // controller: _tabController,
              //     labelColor: Colors.black,
              //     indicatorColor: Colors.blue,
              //     tabs: [
              //       Tab(text: 'Tab 1'),
              //       Tab(text: 'Tab 2'),
              //       Tab(text: 'Tab 3'),
              //     ],
              //   ),
              // ),
              // Expanded(child: WallPaperGrid())
              Expanded(child: CustomTabBarView())
            ],
          ),
        ),
      ),
    );
  }
}

