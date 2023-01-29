import 'package:dio/dio.dart';
import 'package:flutter_practice9/json_files/hotel_nfo/hotel_info.dart';

class Hotel {
  final String uuId;

  List<HotelInfo> hotelsInfo = [];
  String name = '';
  String image = '';
  String country = '';
  String street = '';
  String city = '';
  int zipCode = 0;
  int lat = 0;
  int lan = 0;
  int price = 0;
  int raiting = 0;
  List<String> free = [];
  List<String> paid = [];
  List<String> photos = [];

  void getinfo() async {
    final String url = 'https://run.mocky.io/v3/$uuId';
    final Dio dio = Dio();
    final dioRequest = await dio.get(url);
    dynamic response = dioRequest.data;
    hotelsInfo = response.map((hotel) => HotelInfo.fromJson(hotel)).toList();
  }

  void setInfo() {
    hotelsInfo.map((info) {
      name = info.name;
      image = info.poster;
      country = info.address.country;
      street = info.address.street;
      city = info.address.sity;
      zipCode = info.address.zipCode;
      lat = info.address.coords.lat;
      lan = info.address.coords.lan;
      price = info.price;
      raiting = info.rating;
      free = info.services.free;
      paid = info.services.paid;
      photos = info.photos;
    });
  }

  Hotel(this.uuId) {
    getinfo();
    setInfo();
  }
}
