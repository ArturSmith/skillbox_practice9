import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/home_page/cards.dart';
import 'package:flutter_practice9/home_page/home_page_body.dart';
import 'package:flutter_practice9/home_page/top_row_children.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  bool listOrGrid = true;
  final List<Widget> topRow = const [
    TopRowChildren(childText: 'hotels'),
    TopRowChildren(childText: 'rooms'),
    TopRowChildren(childText: 'condominiums'),
    TopRowChildren(childText: 'apartments'),
    TopRowChildren(childText: 'houses'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: AppColors().mainAppColor,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Welcome'),
            ),
            expandedHeight: 150,
            actions: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      listOrGrid = false;
                    });
                  }),
                  icon: const Icon(Icons.grid_view)),
              IconButton(
                  onPressed: (() {
                    setState(() {
                      listOrGrid = true;
                    });
                  }),
                  icon: const Icon(Icons.list)),
            ],
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: topRow,
                  ))),
          HomePageBody(
            listOrGrid: listOrGrid,
            children: [
              Cards(listOrGrid: listOrGrid, name: 'Continental', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Grozny', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Oslo', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Moscow', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Continental', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Grozny', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Oslo', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Moscow', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Continental', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Grozny', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Oslo', image: ''),
              Cards(listOrGrid: listOrGrid, name: 'Moscow', image: ''),
            ],
          )
        ],
      ),
    );
  }
}
