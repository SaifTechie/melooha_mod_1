import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const ResponsiveWidget({
    Key? key,
    this.maxWidth = 340.0,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}