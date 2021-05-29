import 'package:json_annotation/json_annotation.dart';
import 'package:nawa_platform/model/slider_item.dart';

part 'slider_response.g.dart';

@JsonSerializable()
class SliderResponse{
  List<SliderItem> sliders;

  SliderResponse({this.sliders});

  factory SliderResponse.fromJson(List<dynamic> json) =>
      _$SliderResponseFromJson(json);

  List<dynamic> toJson() => _$SliderResponseToJson(this);

}


