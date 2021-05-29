import 'package:chopper/chopper.dart';
import 'package:nawa_platform/helper/constance.dart';
import 'package:nawa_platform/model/settings_response.dart';
import 'package:nawa_platform/model/slider_response.dart';
import 'package:nawa_platform/model/stories_response.dart';
import 'package:nawa_platform/model/title_response.dart';
import 'package:nawa_platform/network/header_interceptor.dart';
import 'package:nawa_platform/network/model_converter.dart';

part 'portal_service.chopper.dart';


@ChopperApi(baseUrl: "")
abstract class PortalService extends ChopperService {

  @Get(path: Constance.TitleEndPointUrl)
  Future<Response<TitleResponse>> getTitles();

  @Get(path: Constance.TitleEndPointUrl)
  Future<Response<TitleResponse>> getTitlesById(@Query("TitleID") String titleID);

  @Get(path: Constance.TitleEndPointUrl)
  Future<Response<SettingsResponse>> getSettings();

  @Get(path: Constance.SliderEndPointUrl)
  Future<Response<SliderResponse>> getSlider();

  @Get(path: Constance.StoriesEndPointUrl)
  Future<Response<StoriesResponse>> getStoriesAsType(@Query("Type") String typeId);

  @Get(path: Constance.StoriesEndPointUrl)
  Future<Response<StoriesResponse>> getStoriesQ(@Query("q") String q);

  @Get(path: Constance.StoriesEndPointUrl)
  Future<Response<StoriesResponse>> getStoriesForHome({@Query("ShowInHome") String showInHome = '1'});


  static PortalService create() {
    final client = ChopperClient(
        baseUrl: Constance.ApiBaseUrl,
        services: [_$PortalService()],
        converter: ModelConverter(),
        errorConverter: JsonConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
          HeaderInterceptor(),
        ]);
    return _$PortalService(client);
  }
}
