import 'package:flutter/material.dart';

class NotificationSettings extends StatelessWidget {
  final bool cleanupAlerts;
  final bool storageAlerts;
  final bool optimizationTips;
  final ValueChanged<bool> onCleanupAlertsChanged;
  final ValueChanged<bool> onStorageAlertsChanged;
  final ValueChanged<bool> onOptimizationTipsChanged;

  const NotificationSettings({
    super.key,
    required this.cleanupAlerts,
    required this.storageAlerts,
    required this.optimizationTips,
    required this.onCleanupAlertsChanged,
    required this.onStorageAlertsChanged,
    required this.onOptimizationTipsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNotificationTile(
          icon: Icons.cleaning_services,
          title: 'Cleanup Reminders',
          subtitle: 'Get reminded to clean your device regularly',
          value: cleanupAlerts,
          onChanged: onCleanupAlertsChanged,
        ),
        const Divider(height: 1),
        _buildNotificationTile(
          icon: Icons.storage,
          title: 'Storage Alerts',
          subtitle: 'Get notified when storage is running low',
          value: storageAlerts,
          onChanged: onStorageAlertsChanged,
        ),
        const Divider(height: 1),
        _buildNotificationTile(
          icon: Icons.tips_and_updates,
          title: 'Optimization Tips',
          subtitle: 'Receive tips to improve device performance',
          value: optimizationTips,
          onChanged: onOptimizationTipsChanged,
        ),
      ],
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.blue,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
    );
  }
}