import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody(
      {super.key, required this.listOrGrid, required this.children});
  final bool listOrGrid;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return listOrGrid
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
            childCount: children.length,
            (context, index) {
              return children[index];
            },
          ))
        : SliverGrid.count(
            crossAxisCount: 2,
            children: children,
          );
  }
}
