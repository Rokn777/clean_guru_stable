import 'package:flutter/material.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/theme_switcher.dart';
import '../widgets/language_selector.dart';
import '../widgets/notification_settings.dart';
import '../widgets/permission_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // App Preferences Section
          const Text(
            'App Preferences',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const ThemeSwitcher(),
          const LanguageSelector(),
          const SizedBox(height: AppSpacing.lg),

          // Notifications Section
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const NotificationSettings(),
          const SizedBox(height: AppSpacing.lg),

          // Permissions Section
          const Text(
            'Permissions',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          const PermissionManager(),
          const SizedBox(height: AppSpacing.lg),

          // App Info Section
          const Text(
            'App Info',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Version'),
              subtitle: Text('1.0.0'),
            ),
          ),
        ],
      ),
    );
  }
}