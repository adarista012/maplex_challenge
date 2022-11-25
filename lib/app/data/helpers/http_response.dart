import 'package:http/http.dart' as http;

abstract class HttpsResponse {
  static Future<http.Response> get({required String ur, required String query}) async {
    var url = Uri.parse('$ur$query');
    return await http.get(url);
  }
}
