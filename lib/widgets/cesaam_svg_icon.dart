import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CESAAMSvgIcon extends StatelessWidget {
  final String _iconAssetFilePath;
  final double _iconHeight;
  final double _iconWidth;
  Color? _iconColor;

  CESAAMSvgIcon({
    Key? key,
    required String iconAssetFilePath,
    required double iconHeight,
    required double iconWidth,
    Color? iconColor,
  })  : _iconAssetFilePath = iconAssetFilePath,
        _iconHeight = iconHeight,
        _iconWidth = iconWidth,
        _iconColor = iconColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _iconAssetFilePath,
      height: _iconHeight,
      width: _iconWidth,
      color: _iconColor ?? Colors.black,
    );
  }
}
