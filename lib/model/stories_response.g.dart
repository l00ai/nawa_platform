// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesResponse _$StoriesResponseFromJson(List<dynamic> json) {
  return StoriesResponse(
    stories: (json)
        ?.map(
            (e) => e == null ? null : Story.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

List<dynamic> _$StoriesResponseToJson(StoriesResponse instance) => instance.stories;
