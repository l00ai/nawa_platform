import 'package:json_annotation/json_annotation.dart';

part 'slider_item.g.dart';

@JsonSerializable()
class SliderItem{
  @JsonKey(name: 'ID')
  String id;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'TypeTxt')
  String typeTxt;
  @JsonKey(name: 'Link')
  String link;
  @JsonKey(name: 'Img')
  String image;

  SliderItem({this.id, this.name, this.image, this.type, this.link, this.typeTxt});


  factory SliderItem.fromJson(Map<String, dynamic> json) =>
      _$SliderItemFromJson(json);

  Map<String, dynamic> toJson() => _$SliderItemToJson(this);
}