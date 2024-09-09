import 'api_service.dart';

class LoginService {
  final ApiService _apiService;

  LoginService(this._apiService);

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    try {
      final result = await _apiService.post('/user/login', data);
      return result;
    } catch (e) {
      throw Exception('Failed to login user: $e');
    }
  }
}

