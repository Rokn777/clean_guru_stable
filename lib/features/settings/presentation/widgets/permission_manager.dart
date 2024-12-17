import 'package:flutter/material.dart';

class PermissionManager extends StatelessWidget {
  const PermissionManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Storage Access',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Required for cleaning files',
              style: TextStyle(fontSize: 12),
            ),
            leading: Icon(
              Icons.folder_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            trailing: Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              // TODO: Implement permission request
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text(
              'Usage Access',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Required for app usage statistics',
              style: TextStyle(fontSize: 12),
            ),
            leading: Icon(
              Icons.analytics_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            trailing: OutlinedButton(
              onPressed: () {
                // TODO: Implement permission request
              },
              child: const Text('Grant'),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: const Text(
              'Required for cleanup reminders',
              style: TextStyle(fontSize: 12),
            ),
            leading: Icon(
              Icons.notifications_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            trailing: Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              // TODO: Implement permission request
            },
          ),
        ],
      ),
    );
  }
}