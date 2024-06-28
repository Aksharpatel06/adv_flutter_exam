import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiSarvice {
  Future<String?> getData() async {
    String? apiData = 'https://api.quotable.io/quotes?page=1';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      print('api called');
      return response.body;
    } else {
      return null;
    }
  }
}
