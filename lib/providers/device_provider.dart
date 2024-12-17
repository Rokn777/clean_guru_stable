import 'dart:async';
import 'package:flutter/material.dart';
import '../services/device_service.dart';
import '../models/device_state.dart';

class DeviceProvider extends ChangeNotifier {
  final DeviceService _deviceService = DeviceService();
  Timer? _monitoringTimer;
  Timer? _quickUpdateTimer;
  
  DeviceState? _deviceState;
  bool _isLoading = true;
  String? _error;

  // Getters
  DeviceState? get deviceState => _deviceState;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  DeviceProvider() {
    _initializeDeviceState();
    startPeriodicMonitoring();
  }

  void startPeriodicMonitoring() {
    // Full device state monitoring every 5 minutes
    _monitoringTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      refreshDeviceState();
    });

    // Quick RAM and storage updates every 30 seconds
    _quickUpdateTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      if (_deviceState != null) {
        try {
          final ramInfo = await _deviceService.getQuickRamUpdate();
          final storageInfo = await _deviceService.getQuickStorageUpdate();
          
          _deviceState = DeviceState(
            healthScore: _deviceState!.healthScore,
            healthStatus: _deviceState!.healthStatus,
            storageInfo: storageInfo,
            ramInfo: ramInfo,
            lastUpdated: DateTime.now(),
          );
          notifyListeners();
        } catch (e) {
          print('Error in quick update: $e');
        }
      }
    });
  }

  Future<void> _initializeDeviceState() async {
    try {
      _isLoading = true;
      notifyListeners();

      _deviceState = await _deviceService.getDeviceState();
      _error = null;
    } catch (e) {
      _error = 'Failed to initialize device state: $e';
      print('Initialization error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshDeviceState() async {
    if (_isLoading) return;
    
    try {
      final newState = await _deviceService.getDeviceState();
      if (newState != null) {
        _deviceState = newState;
        _error = null;
      }
    } catch (e) {
      _error = 'Error refreshing device state: $e';
      print('Refresh error: $e');
    }
    notifyListeners();
  }

  Future<void> optimizeRam() async {
    try {
      await _deviceService.optimizeRam();
      await refreshDeviceState();
    } catch (e) {
      _error = 'Failed to optimize RAM: $e';
      notifyListeners();
    }
  }

  Future<void> analyzeDisk() async {
    try {
      await _deviceService.analyzeDiskSpace();
      await refreshDeviceState();
    } catch (e) {
      _error = 'Failed to analyze disk: $e';
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _monitoringTimer?.cancel();
    _quickUpdateTimer?.cancel();
    _deviceService.dispose();
    super.dispose();
  }
}