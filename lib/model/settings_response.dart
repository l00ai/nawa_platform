import 'package:json_annotation/json_annotation.dart';

part 'settings_response.g.dart';

@JsonSerializable()
class SettingsResponse {
  @JsonKey(name: 'ID')
  String id;
  @JsonKey(name: 'SiteName')
  String siteName;
  @JsonKey(name: 'Email')
  String email;
  @JsonKey(name: 'Address')
  String address;
  @JsonKey(name: 'Phone')
  String phone;
  @JsonKey(name: 'Facebook')
  String facebook;
  @JsonKey(name: 'Instgrame')
  String instagram;
  @JsonKey(name: 'Twitter')
  String twitter;
  @JsonKey(name: 'Yotube')
  String youtube;
  @JsonKey(name: 'WorkHours')
  String workHours;
  @JsonKey(name: 'About')
  String about;

  SettingsResponse(
      {this.id,
      this.email,
      this.address,
      this.phone,
      this.about,
      this.facebook,
      this.instagram,
      this.siteName,
      this.twitter,
      this.workHours,
      this.youtube});


  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsResponseToJson(this);
}
