import 'package:flutter/material.dart';
import '../../../../core/theme/spacing.dart';
import '../widgets/cleanable_item_card.dart';
import '../widgets/cleanup_progress.dart';
import '../widgets/cleanup_summary.dart';

class CleanerScreen extends StatefulWidget {
  const CleanerScreen({super.key});

  @override
  State<CleanerScreen> createState() => _CleanerScreenState();
}

class _CleanerScreenState extends State<CleanerScreen> {
  bool _isScanning = false;
  bool _hasScanned = false;

  // Mock data - in real app, this would come from a cleaning service
  final List<CleanableItem> _cleanableItems = [
    CleanableItem(
      title: 'Junk Files',
      subtitle: 'Temporary files, logs, and caches',
      size: 1.2,
      icon: Icons.delete_outline,
      type: CleanableType.junk,
    ),
    CleanableItem(
      title: 'Duplicate Files',
      subtitle: 'Identical files in different locations',
      size: 0.8,
      icon: Icons.file_copy_outlined,
      type: CleanableType.duplicate,
    ),
    CleanableItem(
      title: 'Large Files',
      subtitle: 'Files larger than 100MB',
      size: 3.5,
      icon: Icons.storage_outlined,
      type: CleanableType.large,
    ),
    CleanableItem(
      title: 'Unused Apps',
      subtitle: 'Apps not used in the last 3 months',
      size: 2.1,
      icon: Icons.apps_outlined,
      type: CleanableType.apps,
    ),
  ];

  void _startScan() {
    setState(() {
      _isScanning = true;
      _hasScanned = false;
    });

    // Simulate scan delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isScanning = false;
          _hasScanned = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cleaner',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          if (_isScanning) ...[
            const CleanupProgress(),
          ] else if (_hasScanned) ...[
            CleanupSummary(
              totalCleanable: _cleanableItems.fold(
                0.0,
                (sum, item) => sum + item.size,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: _cleanableItems.length,
                separatorBuilder: (context, index) => 
                    const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) {
                  return CleanableItemCard(item: _cleanableItems[index]);
                },
              ),
            ),
          ] else ...[
            const Spacer(),
            Icon(
              Icons.cleaning_services_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'Ready to Clean',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Tap the button below to scan your device',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
          ],
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _isScanning ? null : _startScan,
                child: Text(_hasScanned ? 'Clean Now' : 'Start Scan'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}