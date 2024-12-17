import 'dart:async';
import 'package:flutter/material.dart';
import '../services/cleaning_service.dart';

class CleaningProvider extends ChangeNotifier {
  final CleaningService _cleaningService = CleaningService();
  Timer? _cleanupCheckTimer;
  
  bool _isCleaning = false;
  String? _error;
  CleanupResult? _lastResult;
  final Map<String, bool> _selectedItems = {};
  double _totalCleanable = 0;

  // Getters
  bool get isCleaning => _isCleaning;
  String? get error => _error;
  CleanupResult? get lastResult => _lastResult;
  Map<String, bool> get selectedItems => _selectedItems;
  double get totalCleanable => _totalCleanable;

  CleaningProvider() {
    _initializeCleaningCheck();
    startPeriodicCheck();
  }

  void startPeriodicCheck() {
    // Check cleanable items every 15 minutes
    _cleanupCheckTimer = Timer.periodic(const Duration(minutes: 15), (_) {
      checkCleanableItems();
    });
  }

  Future<void> _initializeCleaningCheck() async {
    await checkCleanableItems();
  }

  Future<void> checkCleanableItems() async {
    try {
      final cleanableItems = await _cleaningService.analyzeCleanableItems();
      _totalCleanable = cleanableItems.values.fold(0, (sum, size) => sum + size);
      notifyListeners();
    } catch (e) {
      _error = 'Error checking cleanable items: $e';
      notifyListeners();
    }
  }

  Future<void> cleanSelected() async {
    if (_isCleaning) return;

    try {
      _isCleaning = true;
      notifyListeners();

      _lastResult = await _cleaningService.cleanItems(_selectedItems);
      await checkCleanableItems();
    } catch (e) {
      _error = 'Failed to clean items: $e';
    } finally {
      _isCleaning = false;
      notifyListeners();
    }
  }

  void toggleItemSelection(String itemType, bool selected) {
    _selectedItems[itemType] = selected;
    notifyListeners();
  }

  void selectAll(bool selected) {
    for (var key in ['Junk Files', 'Duplicate Files', 'Large Files', 'Unused Apps']) {
      _selectedItems[key] = selected;
    }
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _cleanupCheckTimer?.cancel();
    super.dispose();
  }
}