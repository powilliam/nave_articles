import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AssetIcon { rocket }

extension AssetIconExtension on AssetIcon {
  String get asset => ["assets/nave_rocket.svg"][index];
}

class SvgIcon extends StatelessWidget {
  const SvgIcon(
      {Key? key,
      required this.icon,
      this.width = 24,
      this.height = 24,
      this.color = Colors.white})
      : super(key: key);

  final AssetIcon icon;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        icon.asset,
        width: width,
        height: height,
        color: color,
      );
}
