import 'package:flutter_practice9/json_files/hotel_nfo/address/address.dart';
import 'package:flutter_practice9/json_files/hotel_nfo/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInfo {
  final String uuid;
  final String name;
  final String poster;
  final Address address;
  final int price;
  final int rating;
  final Services services;
  final List<String> photos;

  HotelInfo(this.uuid, this.name, this.poster, this.address, this.price,
      this.rating, this.services, this.photos);

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}
