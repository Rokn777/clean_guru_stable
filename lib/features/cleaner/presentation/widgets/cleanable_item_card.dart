 import 'package:flutter/material.dart';
import '../../../../core/theme/spacing.dart';

enum CleanableType {
  junk,
  duplicate,
  large,
  apps,
}

class CleanableItem {
  final String title;
  final String subtitle;
  final double size;
  final IconData icon;
  final CleanableType type;

  CleanableItem({
    required this.title,
    required this.subtitle,
    required this.size,
    required this.icon,
    required this.type,
  });
}

class CleanableItemCard extends StatefulWidget {
  final CleanableItem item;

  const CleanableItemCard({
    super.key,
    required this.item,
  });

  @override
  State<CleanableItemCard> createState() => _CleanableItemCardState();
}

class _CleanableItemCardState extends State<CleanableItemCard> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppSpacing.md),
        leading: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(
                  _isSelected ? 0.1 : 0.05,
                ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            widget.item.icon,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          widget.item.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              widget.item.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.item.size.toStringAsFixed(1)} GB',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          ],
        ),
        trailing: InkWell(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turns: _isSelected ? 0 : -0.25,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                border: Border.all(
                  color: _isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.check,
                size: 20,
                color: _isSelected ? Colors.white : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}