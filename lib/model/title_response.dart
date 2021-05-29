
import 'package:json_annotation/json_annotation.dart';
import 'package:nawa_platform/model/title.dart';

part 'title_response.g.dart';

@JsonSerializable()
class TitleResponse {
  List<Title> titles ;

  TitleResponse(
      {this.titles});

  factory TitleResponse.fromJson(List<dynamic> json) =>
      _$TitleResponseFromJson(json);

  List<dynamic> toJson() => _$TitleResponseToJson(this);
}