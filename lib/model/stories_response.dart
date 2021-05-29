import 'package:json_annotation/json_annotation.dart';
import 'package:nawa_platform/model/story.dart';

part 'stories_response.g.dart';

@JsonSerializable()
class StoriesResponse{
  List<Story> stories;

  StoriesResponse({this.stories});

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$StoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoriesResponseToJson(this);
}