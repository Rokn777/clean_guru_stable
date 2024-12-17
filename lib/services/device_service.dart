import 'dart:async';
import '../features/analysis/engine/health_monitor.dart';
import '../features/analysis/engine/storage_analyzer.dart';
import '../features/analysis/engine/ram_analyzer.dart';
import '../models/device_state.dart';

class DeviceService {
  final healthMonitor = HealthMonitor();
  final storageAnalyzer = StorageAnalyzer();
  final ramAnalyzer = RamAnalyzer();

  Future<DeviceState> getDeviceState() async {
    final healthScore = await healthMonitor.analyzeDeviceHealth();
    final storageInfo = await storageAnalyzer.analyzeStorage();
    final ramInfo = await ramAnalyzer.getRamInfo();

    return DeviceState(
      healthScore: healthScore.score,
      healthStatus: healthScore.status,
      storageInfo: storageInfo,
      ramInfo: ramInfo,
      lastUpdated: DateTime.now(),
    );
  }

  Future<Map<String, double>> getQuickRamUpdate() async {
    return await ramAnalyzer.getRamInfo();
  }

  Future<Map<String, double>> getQuickStorageUpdate() async {
    return await storageAnalyzer.analyzeStorage();
  }

  Future<void> optimizeRam() async {
    // RAM optimization logic
  }

  Future<void> analyzeDiskSpace() async {
    // Disk analysis logic
  }

  void dispose() {
    // Cleanup logic
  }
}