import 'package:dio/dio.dart';
import 'package:flutter_practice9/json_files/hotel_info/hotel_info.dart';
import 'package:flutter_practice9/json_files/hotel_preview.dart';

class ApiHotel {
  Future<List<HotelPreview>> getHotel(String url) async {
    final dio = Dio();
    final dioRequest = await dio.get(url);
    final List<dynamic> response = dioRequest.data;
    final hotels = response.map((e) => HotelPreview.fromJson(e)).toList();
    return hotels;
  }

  Future<HotelInfo> getInfo(String url) async {
    final dio = Dio();
    final dioRequest = await dio.get('https://run.mocky.io/v3/$url');
    final response = dioRequest.data;
    final hotelInfo = HotelInfo.fromJson(response);
    return hotelInfo;
  }
}
