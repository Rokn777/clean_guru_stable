import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/cleaning_provider.dart';
import '../widgets/cleanable_item_card.dart';
import '../widgets/cleanup_progress.dart';
import '../widgets/cleanup_summary.dart';

class CleanerScreen extends StatelessWidget {
  const CleanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cleaner',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<CleaningProvider>(
          builder: (context, provider, child) {
            if (provider.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${provider.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: provider.clearError,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (provider.isCleaning) {
              return const CleanupProgress(
                progress: 0.5,
                status: 'Cleaning files...',
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Total Cleanable',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${provider.totalCleanable.toStringAsFixed(1)} GB',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const Text(
                          'of space can be cleaned',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      CleanableItemCard(
                        title: 'Junk Files',
                        size: '1.2 GB',
                        icon: Icons.delete_outline,
                        isSelected: provider.selectedItems['Junk Files'] ?? false,
                        onSelected: (selected) => 
                            provider.toggleItemSelection('Junk Files', selected ?? false),
                      ),
                      CleanableItemCard(
                        title: 'Duplicate Files',
                        size: '0.8 GB',
                        icon: Icons.file_copy_outlined,
                        isSelected: provider.selectedItems['Duplicate Files'] ?? false,
                        onSelected: (selected) => 
                            provider.toggleItemSelection('Duplicate Files', selected ?? false),
                      ),
                      CleanableItemCard(
                        title: 'Large Files',
                        size: '3.5 GB',
                        icon: Icons.folder_outlined,
                        isSelected: provider.selectedItems['Large Files'] ?? false,
                        onSelected: (selected) => 
                            provider.toggleItemSelection('Large Files', selected ?? false),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: provider.selectedItems.values.any((v) => v)
                          ? provider.cleanSelected
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Clean Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}