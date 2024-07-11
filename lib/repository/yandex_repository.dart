import 'dart:io';

import 'package:dio/dio.dart';

const host = 'https://cloud-api.yandex.net/';

/// Токен авторизации, можно получить по ссылке https://yandex.ru/dev/disk/poligon/ выполнив вход
const authToken = '';

class YandexRepository {
  late final Dio _dio;

  YandexRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: host,
        headers: {
          HttpHeaders.authorizationHeader: 'OAuth $authToken',
        },
      ),
    );
  }

  Future<String> getUploadLink(String path) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'v1/disk/resources/upload',
      queryParameters: {
        'path': path,
      },
    );

    return response.data!['href'] as String;
  }

  Future<bool> uploadToDisk(String url, File file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    final response = await Dio().put(
      url,
      data: formData,
    );

    if (response.statusCode == 200) {
      final map = response.data as Map;
      if (map['status'] == 'Successfully registered') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
