// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderItem _$SliderItemFromJson(Map<String, dynamic> json) {
  return SliderItem(
    id: json['ID'] as String,
    name: json['Name'] as String,
    image: json['Img'] as String,
    type: json['Type'] as String,
    link: json['Link'] as String,
    typeTxt: json['TypeTxt'] as String,
  );
}

Map<String, dynamic> _$SliderItemToJson(SliderItem instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Type': instance.type,
      'TypeTxt': instance.typeTxt,
      'Link': instance.link,
      'Img': instance.image,
    };
