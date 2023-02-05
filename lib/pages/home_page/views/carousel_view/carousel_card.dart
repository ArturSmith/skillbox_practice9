import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatefulWidget {
  const CarouselCard(
      {super.key,
      required this.uuid,
      required this.name,
      required this.poster,
      required this.price,
      required this.rating,
      required this.photos,
      required this.country,
      required this.city,
      required this.street,
      required this.zipCode,
      required this.lat,
      required this.lan,
      required this.free,
      required this.paid});
  final String uuid;
  final String name;
  final String poster;
  final double price;
  final double rating;
  final List<String> photos;
  final String country;
  final String city;
  final String street;
  final int zipCode;
  final double lat;
  final double lan;
  final List<String> free;
  final List<String> paid;
  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
              items: widget.photos
                  .map((e) => GestureDetector(
                      onTap: () {},
                      child: Image(image: AssetImage('assets/images/$e'))))
                  .toList(),
              options: CarouselOptions(
                clipBehavior: Clip.hardEdge,
                aspectRatio: 1.9,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Rating - ${widget.rating}",
                style: const TextStyle(fontSize: 20)),
            Text('Price - ${widget.price}K',
                style: const TextStyle(fontSize: 20)),
          ]),
          const Text('Servises', style: TextStyle(fontSize: 20)),
          const Text('Free:', style: TextStyle(fontSize: 18)),
          ...widget.free.map((e) => Text('-$e')),
          const Text('Paid:', style: TextStyle(fontSize: 18)),
          ...widget.paid.map((e) => Text('-$e')),
          const Text('Address', style: TextStyle(fontSize: 20)),
          Text(
            'Country: ${widget.country}\nCity: ${widget.city}\nStreet: ${widget.street}\nZip code: ${widget.zipCode}\nLan: ${widget.lan}\nLat: ${widget.lat}',
          ),
        ],
      ),
    );
  }
}
