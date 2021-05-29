// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title _$TitleFromJson(Map<String, dynamic> json) {
  return Title(
    name: json['Name'] as String,
    img: json['Img'] as String,
    id: json['ID'] as String,
    userId: json['UserID'] as String,
    title: json['Title'] as String,
  );
}

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Title': instance.title,
      'Img': instance.img,
      'UserID': instance.userId,
    };
