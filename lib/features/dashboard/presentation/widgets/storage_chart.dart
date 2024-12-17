 import 'package:flutter/material.dart';
import '../../../../core/theme/spacing.dart';

class StorageChart extends StatelessWidget {
  const StorageChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data - in real app, this would come from a storage service
    final storageData = {
      'Apps': 45.0,
      'Media': 30.0,
      'Documents': 15.0,
      'Other': 10.0,
    };

    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Storage Analysis',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CustomPaint(
                      painter: StoragePieChart(
                        data: storageData,
                        colors: const [
                          Color(0xFF4CAF50),  // Green
                          Color(0xFFF44336),  // Red
                          Color(0xFF2196F3),  // Blue
                          Color(0xFFFFEB3B),  // Yellow
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...storageData.entries.map((entry) {
                          final index = storageData.keys.toList().indexOf(entry.key);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: [
                                      const Color(0xFF4CAF50),
                                      const Color(0xFFF44336),
                                      const Color(0xFF2196F3),
                                      const Color(0xFFFFEB3B),
                                    ][index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  entry.key,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const Spacer(),
                                Text(
                                  '${entry.value.toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoragePieChart extends CustomPainter {
  final Map<String, double> data;
  final List<Color> colors;

  StoragePieChart({required this.data, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width < size.height ? size.width / 2.5 : size.height / 2.5;
    final rect = Rect.fromCircle(center: center, radius: radius);
    
    // Draw background circle
    final backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey.shade200;
    canvas.drawCircle(center, radius + 2, backgroundPaint);

    var startAngle = -1.5708; // Start from the top (-90 degrees)
    final total = data.values.reduce((a, b) => a + b);

    for (var i = 0; i < data.length; i++) {
      final value = data.values.elementAt(i);
      final sweepAngle = (value / total) * 2 * 3.141592653589793;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = colors[i];

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}