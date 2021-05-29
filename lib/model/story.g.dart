// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) {
  return Story(
    id: json['ID'] as String,
    type: json['Type'] as String,
    typeTxt: json['TypeTxt'] as String,
    painterTxt: json['PainterTxt'] as String,
    videoLink: json['VideoLink'] as String,
    date: json['Date'] as String,
    name: json['Name'] as String,
    author: json['Author'] as String,
    authorTxt: json['AuthorTxt'] as String,
    targetGroup: json['TargetGroup'] as String,
    targetGroupTxt: json['TargetGroupTxt'] as String,
    details: json['Details'] as String,
    showInHome: json['ShowInHome'] as String,
    active: json['Active'] as String,
    userID: json['UserID'] as String,
    thumbnail: json['Thumbnail'] as String,
    publishingHouse: json['PublishingHouse'] as String,
    publishingHouseTxt: json['PublishingHouseTxt'] as String,
  );
}

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'ID': instance.id,
      'Type': instance.type,
      'TypeTxt': instance.typeTxt,
      'PainterTxt': instance.painterTxt,
      'VideoLink': instance.videoLink,
      'Date': instance.date,
      'Name': instance.name,
      'Author': instance.author,
      'AuthorTxt': instance.authorTxt,
      'TargetGroup': instance.targetGroup,
      'TargetGroupTxt': instance.targetGroupTxt,
      'Details': instance.details,
      'ShowInHome': instance.showInHome,
      'Active': instance.active,
      'UserID': instance.userID,
      'Thumbnail': instance.thumbnail,
      'PublishingHouse': instance.publishingHouse,
      'PublishingHouseTxt': instance.publishingHouseTxt,
    };
