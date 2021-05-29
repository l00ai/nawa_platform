// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleResponse _$TitleResponseFromJson(List<dynamic> json) {
  return TitleResponse(
    titles: (json)
        ?.map(
            (e) => e == null ? null : Title.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

List<dynamic> _$TitleResponseToJson(TitleResponse instance) => instance.titles;
