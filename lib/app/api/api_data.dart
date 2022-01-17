import 'package:dio/dio.dart';
import 'package:smart_bin_app/app/api/api_constants.dart';
import 'package:smart_bin_app/app/models/data.dart';

class ApiData {
  static final Dio _dataDio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    ),
  );

  static Future<Data> getData(String id) async {
    try {
      final response = await _dataDio.get(
        '/getWeight',
        queryParameters: {
          'deviceId': id,
        },
      );
      if (response.data != null) {
        return Data.fromMap(response.data);
      }
      throw Exception('No data: expected arduino data!');
    } catch (e) {
      rethrow;
    }
  }
}
