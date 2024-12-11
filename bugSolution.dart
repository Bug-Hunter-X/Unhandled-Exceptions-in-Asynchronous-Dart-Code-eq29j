```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'), headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
      print('Data fetched successfully: $jsonData');
    } else if (response.statusCode == 404) {
      print('Not Found Error (404)');
    } else if (response.statusCode == 500) {
      print('Internal Server Error (500)');
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('JSON format error: $e');
  } on TimeoutException catch (e) {
    print('Timeout error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```