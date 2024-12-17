import 'package:flutter/material.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDarkMode = false;
  bool _isSystemMode = true;

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
              'Dark Mode',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              _isDarkMode ? 'Dark theme enabled' : 'Light theme enabled',
              style: const TextStyle(fontSize: 12),
            ),
            secondary: Icon(
              _isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.primary,
            ),
            value: _isDarkMode,
            onChanged: _isSystemMode ? null : (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text(
              'Use System Theme',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Automatically switch based on system settings',
              style: TextStyle(fontSize: 12),
            ),
            secondary: Icon(
              Icons.settings_brightness,
              color: Theme.of(context).colorScheme.primary,
            ),
            value: _isSystemMode,
            onChanged: (bool value) {
              setState(() {
                _isSystemMode = value;
              });
            },
          ),
        ],
      ),
    );
  }
}