import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/home_page/hotels_cards/cards.dart';
import 'package:flutter_practice9/json_files/hotel.dart';

// ignore: must_be_immutable
class HomePageBody extends StatefulWidget {
  final List<Widget> topRow;
  final List<HotelPreview> hotels;
  const HomePageBody({super.key, required this.topRow, required this.hotels});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool listOrGrid = false;

  List<Widget> createCards() {
    List<Widget> cards = widget.hotels
        .map((hotel) =>
            Cards(listOrGrid: listOrGrid, name: hotel.name, image: ''))
        .toList();
    return cards;
  }

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
                  listOrGrid = false;
                });
              }),
              icon: const Icon(Icons.grid_view),
            ),
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
                  children: widget.topRow,
                ))),
        listOrGrid
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                childCount: createCards().length,
                (context, index) {
                  return createCards()[index];
                },
              ))
            : SliverGrid.count(
                crossAxisCount: 2,
                children: createCards(),
              )
      ],
    );
  }
}
