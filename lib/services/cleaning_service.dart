class CleaningService {
  Future<Map<String, double>> analyzeCleanableItems() async {
    // Mock data for testing
    return {
      'Junk Files': 1.2,
      'Duplicate Files': 0.8,
      'Large Files': 3.5,
      'Unused Apps': 2.1,
    };
  }

  Future<CleanupResult> cleanItems(Map<String, bool> selectedItems) async {
    // Mock cleanup logic
    return CleanupResult(
      success: true,
      spaceFreed: 2.5,
      cleanedItems: selectedItems.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList(),
      message: 'Cleanup completed successfully',
    );
  }
}

class CleanupResult {
  final bool success;
  final double spaceFreed;
  final List<String> cleanedItems;
  final String message;

  CleanupResult({
    required this.success,
    required this.spaceFreed,
    required this.cleanedItems,
    required this.message,
  });
}