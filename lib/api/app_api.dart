import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_images/constants/app_constants.dart';
import 'package:nasa_images/model/nasa_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppApi {
  static var dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 3),
      baseUrl: AppConstants.baseUrl,
      queryParameters: {'api_key': dotenv.env[AppConstants.apiKey]},
    ),
  );

  static Future<List<NasaImage>?> getImages() async {
    try {
      dio.options.queryParameters['sol'] = 1000;
      final response = await dio.get(AppConstants.endPoints.roverPhotos);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        final json = response.data['photos'] as List<dynamic>;
        return json.map((imageData) => NasaImage.fromJson(imageData)).toList();
      } else {
        if (kDebugMode) {
          print('${response.statusCode} : ${response.data.toString()}');
        }
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return null;
    }
  }
}
