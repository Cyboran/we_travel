import 'package:flutter/material.dart';

class TimelineConnector extends StatelessWidget {
  final bool isStop;
  final IconData? icon;
  final Widget child;
  final bool isFirst;
  final bool isLast;

  const TimelineConnector({
    super.key,
    required this.isStop,
    this.icon,
    required this.child,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline column
        Container(
          width: 32,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              if (!isFirst) _buildTopLine(),
              _buildMarker(),
              if (!isLast) _buildBottomLine(),
            ],
          ),
        ),

        const SizedBox(width: 8),

        // Card content
        Expanded(child: child),
      ],
    );
  }

  Widget _buildMarker() {
    return isStop
        ? Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          )
        : Icon(icon ?? Icons.directions, size: 16, color: Colors.grey[600]);
  }

  Widget _buildTopLine() => Container(
        height: 12,
        width: 2,
        color: Colors.grey[300],
      );

  Widget _buildBottomLine() => Container(
        height: 32,
        width: 2,
        color: Colors.grey[300],
      );
}