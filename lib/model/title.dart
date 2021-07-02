import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
class Title{
  @JsonKey(name: 'ID')
  String id ;
  @JsonKey(name: 'Name')
  String name ;
  @JsonKey(name: 'Title')
  String title ;
  @JsonKey(name: 'Img')
  String img ;
  @JsonKey(name: 'UserID')
  String userId ;
  @JsonKey(name: 'TypeID')
  String typeID ;

  Title({this.name, this.img, this.id, this.userId, this.title, this.typeID});

  factory Title.fromJson(Map<String, dynamic> json) =>
      _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}