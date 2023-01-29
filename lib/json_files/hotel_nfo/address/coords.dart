import 'package:json_annotation/json_annotation.dart';

part 'coords.g.dart';

@JsonSerializable(explicitToJson: true)
class Coords {
  final int lat;
  final int lan;

  Coords(this.lat, this.lan);

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}
