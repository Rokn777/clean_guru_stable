class StorageAnalyzer {
  Future<Map<String, double>> analyzeStorage() async {
    // Mock data for testing
    return {
      'apps': 45.0,
      'media': 30.0,
      'documents': 15.0,
      'other': 10.0,
    };
  }
}