import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable(explicitToJson: true)
class Services {
  final List<String> free;
  final List<String> paid;

  Services(this.free, this.paid);

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
