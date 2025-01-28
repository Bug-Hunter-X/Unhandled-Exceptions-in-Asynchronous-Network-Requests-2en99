```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the response
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle non-200 status codes, throwing an exception can be useful
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions appropriately
    print('Error fetching data: $e');
    // Consider rethrowing the exception or handling it based on your application's needs.
    rethrow; // This will propagate the error up the call stack
  }
}
```