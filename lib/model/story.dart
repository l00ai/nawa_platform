import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable()
class Story {
  @JsonKey(name: 'ID')
  String id;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'TypeTxt')
  String typeTxt;
  @JsonKey(name: 'PainterTxt')
  String painterTxt;
  @JsonKey(name: 'VideoLink')
  String videoLink;
  @JsonKey(name: 'Date')
  String date;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Author')
  String author;
  @JsonKey(name: 'AuthorTxt')
  String authorTxt;
  @JsonKey(name: 'TargetGroup')
  String targetGroup;
  @JsonKey(name: 'TargetGroupTxt')
  String targetGroupTxt;
  @JsonKey(name: 'Details')
  String details;
  @JsonKey(name: 'ShowInHome')
  String showInHome;
  @JsonKey(name: 'Active')
  String active;
  @JsonKey(name: 'UserID')
  String userID;
  @JsonKey(name: 'Thumbnail')
  String thumbnail;
  @JsonKey(name: 'PublishingHouse')
  String publishingHouse;
  @JsonKey(name: 'PublishingHouseTxt')
  String publishingHouseTxt;

  Story(
      {this.id,
      this.type,
      this.typeTxt,
      this.painterTxt,
      this.videoLink,
      this.date,
      this.name,
      this.author,
      this.authorTxt,
      this.targetGroup,
      this.targetGroupTxt,
      this.details,
      this.showInHome,
      this.active,
      this.userID,
      this.thumbnail,
      this.publishingHouse,
      this.publishingHouseTxt});

  factory Story.fromJson(Map<String, dynamic> json) =>
      _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}