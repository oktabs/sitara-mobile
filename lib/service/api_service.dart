import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000/api'));

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    final response = await _dio.post('/auth/register', data: {
      "name": name,
      "email": email,
      "password": password,
      "role": role,
    });
    print(response.data);
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        "email": email,
        "password": password,
      });

      if (response.data['token'] != null) {
        return response.data['token'];
      }
    } catch (e) {
      print("Login failed: $e");
    }

    return null;
  }
}
