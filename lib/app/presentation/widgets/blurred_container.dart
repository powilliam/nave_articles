import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    Key? key,
    this.sigma = 5,
    this.color = Colors.black,
    this.opacity = 0,
    this.child,
  }) : super(key: key);

  final double sigma;
  final double opacity;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: Container(
            color: color.withOpacity(opacity),
            child: child,
          ),
        ),
      );
}
