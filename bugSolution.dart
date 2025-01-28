```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      // More specific exception handling
      throw Exception('HTTP request failed with status: ${response.statusCode}.  Response body: ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle socket exceptions separately
    print('Network error: $e');
    return null; // Or throw a custom exception
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    // Catch any other exceptions
    print('Unexpected error: $e');
    rethrow; // Re-throw to allow higher-level error handling
  }
}
```