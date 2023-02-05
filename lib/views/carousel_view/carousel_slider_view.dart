import 'package:flutter/material.dart';
import 'package:flutter_practice9/api/api_hotel.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/views/carousel_view/carousel_card.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key, required this.uuid});
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiHotel().getInfo(uuid),
        builder: ((context, AsyncSnapshot snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors().mainAppColor,
                title: Text(
                  snapshot.data != null ? snapshot.data.name : 'Loading...',
                  style: const TextStyle(fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: snapshot.data != null
                  ? CarouselCard(
                      uuid: uuid,
                      name: snapshot.data!.name,
                      poster: snapshot.data!.poster,
                      price: snapshot.data!.price,
                      rating: snapshot.data!.rating,
                      photos: snapshot.data!.photos,
                      country: snapshot.data!.address.country,
                      city: snapshot.data!.address.city,
                      street: snapshot.data!.address.street,
                      zipCode: snapshot.data!.address.zip_code,
                      lat: snapshot.data!.address.coords.lat,
                      lan: snapshot.data!.address.coords.lan,
                      free: snapshot.data!.services.free,
                      paid: snapshot.data!.services.paid)
                  : const Center(child: CircularProgressIndicator()));
        }));
  }
}
