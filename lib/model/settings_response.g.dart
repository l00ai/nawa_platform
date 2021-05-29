// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsResponse _$SettingsResponseFromJson(Map<String, dynamic> json) {
  return SettingsResponse(
    id: json['ID'] as String,
    email: json['Email'] as String,
    address: json['Address'] as String,
    phone: json['Phone'] as String,
    about: json['About'] as String,
    facebook: json['Facebook'] as String,
    instagram: json['Instgrame'] as String,
    siteName: json['SiteName'] as String,
    twitter: json['Twitter'] as String,
    workHours: json['WorkHours'] as String,
    youtube: json['Yotube'] as String,
  );
}

Map<String, dynamic> _$SettingsResponseToJson(SettingsResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'SiteName': instance.siteName,
      'Email': instance.email,
      'Address': instance.address,
      'Phone': instance.phone,
      'Facebook': instance.facebook,
      'Instgrame': instance.instagram,
      'Twitter': instance.twitter,
      'Yotube': instance.youtube,
      'WorkHours': instance.workHours,
      'About': instance.about,
    };
