import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _cleanupReminders = true;
  bool _storageAlerts = true;
  bool _optimizationTips = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text(
              'Cleanup Reminders',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Get reminded to clean your device regularly',
              style: TextStyle(fontSize: 12),
            ),
            value: _cleanupReminders,
            onChanged: (bool value) {
              setState(() {
                _cleanupReminders = value;
              });
            },
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text(
              'Storage Alerts',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Get notified when storage is running low',
              style: TextStyle(fontSize: 12),
            ),
            value: _storageAlerts,
            onChanged: (bool value) {
              setState(() {
                _storageAlerts = value;
              });
            },
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text(
              'Optimization Tips',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Receive tips to optimize device performance',
              style: TextStyle(fontSize: 12),
            ),
            value: _optimizationTips,
            onChanged: (bool value) {
              setState(() {
                _optimizationTips = value;
              });
            },
          ),
        ],
      ),
    );
  }
}