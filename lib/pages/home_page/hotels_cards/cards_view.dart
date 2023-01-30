import 'package:flutter/material.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/grid_card.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/list_card.dart';

class CardsView {
  final String name;
  final String image;
  final String uuId;
  late Widget listCard;
  late Widget gridCard;
  late Widget carouselCard;
  CardsView(this.name, this.image, this.uuId) {
    listCard = ListCard(name: name, image: image);
    gridCard = GridCard(name: name, image: image);
  }
}
