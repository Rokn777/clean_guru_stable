class DeviceState {
  final int healthScore;
  final String healthStatus;
  final Map<String, double> storageInfo;
  final Map<String, double> ramInfo;
  final DateTime lastUpdated;

  DeviceState({
    required this.healthScore,
    required this.healthStatus,
    required this.storageInfo,
    required this.ramInfo,
    required this.lastUpdated,
  });

  String get formattedLastUpdate {
    return '${lastUpdated.hour}:${lastUpdated.minute.toString().padLeft(2, '0')}';
  }
}