// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      (json['lat'] as num).toDouble(),
      (json['lan'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };
