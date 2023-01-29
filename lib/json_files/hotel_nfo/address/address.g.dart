// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['country'] as String,
      json['street'] as String,
      json['sity'] as String,
      json['zipCode'] as int,
      Coords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'sity': instance.sity,
      'zipCode': instance.zipCode,
      'coords': instance.coords.toJson(),
    };
