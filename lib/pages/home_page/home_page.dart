import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/views/grid_view/grid_view_hotel.dart';
import 'package:flutter_practice9/views/list_view/list_view_hotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePage> {
  bool bedOrBar = true;
  bool listOrGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: AppColors().mainAppColor,
          title: bedOrBar ? const Text('Отели') : const Text('Бары'),
          centerTitle: true,
          actions: [
            IconButton(
              color: listOrGrid ? Colors.black : Colors.white,
              onPressed: (() {
                setState(() {
                  listOrGrid = false;
                });
              }),
              icon: const Icon(Icons.grid_view),
            ),
            IconButton(
                color: listOrGrid ? Colors.white : Colors.black,
                onPressed: (() {
                  setState(() {
                    listOrGrid = true;
                  });
                }),
                icon: const Icon(Icons.list)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            setState(() {
              bedOrBar = !bedOrBar;
            });
          }),
          backgroundColor: AppColors().mainAppColor,
          child: bedOrBar
              ? const Icon(
                  Icons.sports_bar,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.bed,
                  color: Colors.white,
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: listOrGrid ? const ListViewHotels() : const GridViewHotels());
  }
}
