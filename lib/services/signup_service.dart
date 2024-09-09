import 'api_service.dart';

class SignupService {
  final ApiService _apiService;

  SignupService(this._apiService);

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      final result = await _apiService.post('/user/register', data);
      return result;
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }
}

