// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
