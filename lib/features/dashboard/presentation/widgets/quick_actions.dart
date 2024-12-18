import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/cleaning_provider.dart';
import '../../../../providers/device_provider.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _QuickActionButton(
                  icon: Icons.cleaning_services,
                  label: 'Clean Storage',
                  color: Colors.blue,
                  onTap: () => _cleanStorage(context),
                ),
                _QuickActionButton(
                  icon: Icons.memory,
                  label: 'Boost RAM',
                  color: Colors.green,
                  onTap: () => _boostRam(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _QuickActionButton(
                  icon: Icons.cached,
                  label: 'Clear Cache',
                  color: Colors.orange,
                  onTap: () => _clearCache(context),
                ),
                _QuickActionButton(
                  icon: Icons.apps,
                  label: 'App Manager',
                  color: Colors.purple,
                  onTap: () => _openAppManager(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _cleanStorage(BuildContext context) {
    final cleaningProvider = context.read<CleaningProvider>();
    cleaningProvider.toggleItemSelection('Junk Files', true);
    cleaningProvider.toggleItemSelection('Cache Files', true);
    cleaningProvider.cleanSelected();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cleaning storage...')),
    );
  }

  void _boostRam(BuildContext context) {
    context.read<DeviceProvider>().optimizeRam();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('RAM optimization in progress...')),
    );
  }

  void _clearCache(BuildContext context) {
    final cleaningProvider = context.read<CleaningProvider>();
    cleaningProvider.toggleItemSelection('Cache Files', true);
    cleaningProvider.cleanSelected();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Clearing cache...')),
    );
  }

  void _openAppManager(BuildContext context) {
    // This will be implemented later
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('App Manager coming soon...')),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}