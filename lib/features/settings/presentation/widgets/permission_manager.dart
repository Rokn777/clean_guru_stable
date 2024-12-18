import 'package:flutter/material.dart';

class PermissionManager extends StatelessWidget {
  const PermissionManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPermissionTile(
          icon: Icons.folder,
          title: 'Storage Access',
          subtitle: 'Required for cleaning files',
          isGranted: true,
          onTap: () {/* Handle storage permission */},
        ),
      ],
    );
  }

  Widget _buildPermissionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isGranted,
    required VoidCallback onTap,
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
      trailing: Icon(
        isGranted ? Icons.check_circle : Icons.arrow_forward_ios,
        color: isGranted ? Colors.green : Colors.grey,
        size: isGranted ? 24 : 16,
      ),
      onTap: onTap,
    );
  }
}