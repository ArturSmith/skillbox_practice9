import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/json_files/hotel.dart';

class CarouselSliderView extends StatelessWidget {
  CarouselSliderView({
    super.key,
    required this.hotels,
  });
  final List<HotelPreview> hotels;
  final CarouselController controller = CarouselController();

  List<Widget> getItems() {
    final List<Widget> items =
        hotels.map((hotel) => CarouselSliderBody(image: hotel.poster)).toList();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        carouselController: controller,
        items: getItems(),
        options: CarouselOptions());
  }
}

class CarouselSliderBody extends StatelessWidget {
  const CarouselSliderBody({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/$image')),
      ],
    );
  }
}
