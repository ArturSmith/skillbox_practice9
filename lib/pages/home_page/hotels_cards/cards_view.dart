import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/json_files/hotel.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/grid_card.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/list_card.dart';

class CardsView extends StatefulWidget {
  const CardsView(
      {super.key,
      required this.listOrGrid,
      required this.isLoading,
      required this.hotels,
      this.errorResponse});
  final bool listOrGrid;
  final bool isLoading;
  final List<HotelPreview> hotels;
  final DioError? errorResponse;
  @override
  State<CardsView> createState() => _CardsState();
}

class _CardsState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? widget.errorResponse == null
            ? widget.listOrGrid
                ? _Functions().returnListCards(widget.hotels)
                : _Functions().returnGridCards(widget.hotels)
            : Center(child: Text('Error $widget.errorResponse'))
        : Center(
            child: CircularProgressIndicator(
              color: AppColors().mainAppColor,
            ),
          );
  }
}

class _Functions {
  Widget returnListCards(List<HotelPreview> hotels) {
    List<Widget> cards = hotels
        .map((hotel) => ListCard(name: hotel.name, image: hotel.poster))
        .toList();

    final Widget listCards = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
          itemBuilder: ((context, index) {
            return cards[index];
          }),
          separatorBuilder: ((context, index) => const SizedBox(height: 10)),
          itemCount: cards.length),
    );
    return listCards;
  }

  Widget returnGridCards(List<HotelPreview> hotels) {
    List<Widget> cards = hotels
        .map((hotel) => GridCard(name: hotel.name, image: hotel.poster))
        .toList();

    final Widget gridCards = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.count(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: cards),
    );
    return gridCards;
  }

  void returnCarouselSlider(List<HotelPreview> hotels) {}
}
