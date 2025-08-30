import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final Widget label;

  const Badge({super.key, required this.child, required this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child,
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16),
            child: Center(
              child: label,
            ),
          ),
        ),
      ],
    );
  }
}
