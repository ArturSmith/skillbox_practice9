import 'package:flutter/material.dart';
import 'package:flutter_practice9/json_files/hotel.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/cards_view.dart';

class CardsViews {
  Widget returnListCards(List<HotelPreview> hotelsPreview) {
    List<Widget> cards = hotelsPreview
        .map(
            (hotel) => CardsView(hotel.name, hotel.poster, hotel.uuid).listCard)
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

  Widget returnGridCards(List<HotelPreview> hotelsPreview) {
    List<Widget> cards = hotelsPreview
        .map(
            (hotel) => CardsView(hotel.name, hotel.poster, hotel.uuid).gridCard)
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
