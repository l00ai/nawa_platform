// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponse _$SliderResponseFromJson(List<dynamic> json) {
  return SliderResponse(
    sliders: (json)
        ?.map((e) =>
            e == null ? null : SliderItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

List<dynamic> _$SliderResponseToJson(SliderResponse instance) => instance.sliders;
