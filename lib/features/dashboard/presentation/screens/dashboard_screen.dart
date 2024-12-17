 import 'package:flutter/material.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/health_score_card.dart';
import '../widgets/storage_chart.dart';
import '../widgets/quick_actions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HealthScoreCard(),
            SizedBox(height: AppSpacing.lg),
            const QuickActions(),
            SizedBox(height: AppSpacing.lg),
            const StorageChart(),
          ],
        ),
      ),
    );
  }
}
