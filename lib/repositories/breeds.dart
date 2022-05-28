import 'package:dio/dio.dart';

final Dio _dio = new Dio();

Future<List<dynamic>> getBreeds() async {
  try {
    var response = await _dio.get(
      'https://api.thecatapi.com/v1/breeds',
      options: Options(
        headers: {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'},
      ),
    );
    return response.data;
  } catch (e) {
    print(e);
  }
}
