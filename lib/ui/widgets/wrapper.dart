import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final double width;
  const Wrapper({this.child, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: this.child,
    );
  }
}