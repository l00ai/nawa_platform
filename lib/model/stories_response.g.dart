// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesResponse _$StoriesResponseFromJson(Map<String, dynamic> json) {
  return StoriesResponse(
    stories: (json['stories'] as List)
        ?.map(
            (e) => e == null ? null : Story.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StoriesResponseToJson(StoriesResponse instance) =>
    <String, dynamic>{
      'stories': instance.stories,
    };
