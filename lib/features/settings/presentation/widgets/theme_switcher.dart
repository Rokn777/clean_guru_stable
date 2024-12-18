import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final bool useSystemTheme;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onSystemThemeChanged;

  const ThemeSwitcher({
    super.key,
    required this.isDarkMode,
    required this.useSystemTheme,
    required this.onDarkModeChanged,
    required this.onSystemThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.blue,
              size: 24,
            ),
          ),
          title: const Text(
            'Dark Mode',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            isDarkMode ? 'Dark theme enabled' : 'Light theme enabled',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          trailing: Switch.adaptive(
            value: isDarkMode,
            onChanged: onDarkModeChanged,
            activeColor: Colors.blue,
          ),
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.brightness_auto,
              color: Colors.blue,
              size: 24,
            ),
          ),
          title: const Text(
            'Use System Theme',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          subtitle: const Text(
            'Automatically switch based on system settings',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          trailing: Switch.adaptive(
            value: useSystemTheme,
            onChanged: onSystemThemeChanged,
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}