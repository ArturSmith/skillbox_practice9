import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderView extends StatelessWidget {
  CarouselSliderView({
    super.key,
    required this.uuId,
  });
  final String uuId;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center();
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
