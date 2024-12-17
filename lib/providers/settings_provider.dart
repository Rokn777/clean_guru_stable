import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  
  // Theme settings
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  // Language settings
  String _currentLanguage = 'English';
  String get currentLanguage => _currentLanguage;

  // Notification settings
  bool _cleanupAlerts = true;
  bool _storageAlerts = true;
  bool _optimizationTips = true;

  bool get cleanupAlerts => _cleanupAlerts;
  bool get storageAlerts => _storageAlerts;
  bool get optimizationTips => _optimizationTips;

  Future<void> initializeSettings() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      _loadSettings();
    } catch (e) {
      debugPrint('Error initializing settings: $e');
    }
  }

  void _loadSettings() {
    _isDarkMode = _prefs?.getBool('isDarkMode') ?? false;
    _currentLanguage = _prefs?.getString('language') ?? 'English';
    _cleanupAlerts = _prefs?.getBool('cleanupAlerts') ?? true;
    _storageAlerts = _prefs?.getBool('storageAlerts') ?? true;
    _optimizationTips = _prefs?.getBool('optimizationTips') ?? true;
    notifyListeners();
  }

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    await _prefs?.setBool('isDarkMode', value);
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _currentLanguage = language;
    await _prefs?.setString('language', language);
    notifyListeners();
  }

  Future<void> setCleanupAlerts(bool value) async {
    _cleanupAlerts = value;
    await _prefs?.setBool('cleanupAlerts', value);
    notifyListeners();
  }

  Future<void> setStorageAlerts(bool value) async {
    _storageAlerts = value;
    await _prefs?.setBool('storageAlerts', value);
    notifyListeners();
  }

  Future<void> setOptimizationTips(bool value) async {
    _optimizationTips = value;
    await _prefs?.setBool('optimizationTips', value);
    notifyListeners();
  }

  Future<void> resetSettings() async {
    await _prefs?.clear();
    _loadSettings();
  }
}