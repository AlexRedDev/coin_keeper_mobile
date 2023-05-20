import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgView extends StatelessWidget {
  const SvgView(
    this.path, {
    this.size,
    this.fit,
        this.color,
    super.key,
  });

  final String path;
  final double? size;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$path.svg',
      height: size,
      width: size,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }
}
