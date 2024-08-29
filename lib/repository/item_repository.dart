// lib/repository/item_repository.dart

class ItemRepository {
  // Hardcoded response
  final Map<String, dynamic> _mockResponse = {
    "totalItems": 100, // Total number of items available
    "pageSize": 10, // Number of items per page
    "currentPage": 2, // Current page number
    "totalPages": 5, // Total number of pages
    "items": [
      {"id": 21, "name": "Item 21"},
      {"id": 22, "name": "Item 22"},
      {"id": 23, "name": "Item 23"},
      {"id": 24, "name": "Item 24"},
      {"id": 25, "name": "Item 25"},
      {"id": 26, "name": "Item 26"},
      {"id": 27, "name": "Item 27"},
      {"id": 28, "name": "Item 28"},
      {"id": 29, "name": "Item 29"},
      {"id": 30, "name": "Item 30"}
    ]
  };

  Future<Map<String, dynamic>> fetchItems(int page, int pageSize) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return the hardcoded response
    return _mockResponse;
  }
}
