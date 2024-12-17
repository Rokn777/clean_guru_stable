class HealthMonitor {
  Future<HealthScore> analyzeDeviceHealth() async {
    // Mock data for testing
    return HealthScore(
      score: 85,
      status: 'Device is running well',
      details: {
        'storage': {'used': 45.5, 'total': 128.0},
        'ram': {'used': 3.2, 'total': 8.0},
      },
    );
  }
}

class HealthScore {
  final int score;
  final String status;
  final Map<String, dynamic> details;

  HealthScore({
    required this.score,
    required this.status,
    required this.details,
  });
}