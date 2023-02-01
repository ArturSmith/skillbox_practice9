import 'package:flutter/material.dart';
import 'package:flutter_practice9/api/api_hotel.dart';
import 'package:flutter_practice9/json_files/hotel_info/hotel_info.dart';
import 'package:flutter_practice9/pages/home_page/views/carousel_view/carousel_view_card.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key, required this.uuid});
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiHotel().getInfo(uuid),
        builder: ((context, AsyncSnapshot<HotelInfo> snapshot) {
          return snapshot.data != null
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
              : const Center(child: CircularProgressIndicator());
        }));
  }
}
