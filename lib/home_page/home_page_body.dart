import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

// ignore: must_be_immutable
class HomePageBody extends StatefulWidget {
  bool listOrGrid;
  final List<Widget> children;
  final List<Widget> topRow;

  HomePageBody(
      {super.key,
      required this.listOrGrid,
      required this.children,
      required this.topRow});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                    widget.listOrGrid = false;
                  });
                }),
                icon: const Icon(Icons.grid_view)),
            IconButton(
                onPressed: (() {
                  setState(() {
                    widget.listOrGrid = true;
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
                  children: widget.topRow,
                ))),
        widget.listOrGrid
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                childCount: widget.children.length,
                (context, index) {
                  return widget.children[index];
                },
              ))
            : SliverGrid.count(
                crossAxisCount: 2,
                children: widget.children,
              )
      ],
    );
  }
}
