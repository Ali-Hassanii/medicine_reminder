import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
    this.path = "assets/pictures/svg/",
  });
  final String icon;
  final Color? color;
  final double? size;

  final String path;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "$path$icon.svg",

      // Color
      colorFilter: ColorFilter.mode(
        color ?? IconTheme.of(context).color!,
        BlendMode.srcIn,
      ),

      // Size
      height: size ?? IconTheme.of(context).size,
      width: size ?? IconTheme.of(context).size,
    );
  }
}
