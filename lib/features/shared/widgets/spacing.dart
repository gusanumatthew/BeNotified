import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double? width;
  final double? height;

  const Spacing({
    this.height,
    this.width,
  });

  const Spacing.width(this.width) : height = 0;

  const Spacing.height(this.height) : width = 0;

  const Spacing.smallHeight() : this.height(8);
  const Spacing.mediumHeight() : this.height(16);
  const Spacing.bigHeight() : this.height(24);
  const Spacing.largeHeight() : this.height(32);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
