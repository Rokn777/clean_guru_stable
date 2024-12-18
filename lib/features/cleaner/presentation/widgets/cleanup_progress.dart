import 'package:flutter/material.dart';

class CleanupProgress extends StatefulWidget {
  final double progress;
  final String status;
  final VoidCallback? onCancel;

  const CleanupProgress({
    super.key,
    required this.progress,
    required this.status,
    this.onCancel,
  });

  @override
  State<CleanupProgress> createState() => _CleanupProgressState();
}

class _CleanupProgressState extends State<CleanupProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _animation,
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cleaning_services,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Cleaning in Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.status,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: widget.progress,
            backgroundColor: Colors.blue.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            borderRadius: BorderRadius.circular(8),
            minHeight: 8,
          ),
          const SizedBox(height: 24),
          if (widget.onCancel != null)
            TextButton.icon(
              onPressed: widget.onCancel,
              icon: const Icon(Icons.cancel),
              label: const Text('Cancel'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}