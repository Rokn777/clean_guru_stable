import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/settings_provider.dart';
import '../widgets/language_selector.dart';
import '../widgets/notification_settings.dart';
import '../widgets/permission_manager.dart';
import '../widgets/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'App Preferences',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ThemeSwitcher(
                isDarkMode: settings.isDarkMode,
                useSystemTheme: settings.useSystemTheme,
                onDarkModeChanged: settings.setDarkMode,
                onSystemThemeChanged: settings.setUseSystemTheme,
              ),
              LanguageSelector(
                currentLanguage: settings.currentLanguage,
                onLanguageChanged: settings.setLanguage,
              ),
              const SizedBox(height: 24),
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              NotificationSettings(
                cleanupAlerts: settings.cleanupAlerts,
                storageAlerts: settings.storageAlerts,
                optimizationTips: settings.optimizationTips,
                onCleanupAlertsChanged: settings.setCleanupAlerts,
                onStorageAlertsChanged: settings.setStorageAlerts,
                onOptimizationTipsChanged: settings.setOptimizationTips,
              ),
              const SizedBox(height: 24),
              const Text(
                'Permissions',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const PermissionManager(),
            ],
          );
        },
      ),
    );
  }
}