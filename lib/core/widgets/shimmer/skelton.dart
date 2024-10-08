import '../../routes/barrel.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    this.radius = 0.0,
    this.colorShade = 200,
    this.padding,
  });
  final double? height, width;
  final EdgeInsets? padding;
  final double? radius;
  final int colorShade;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[colorShade] ?? Colors.grey,
        highlightColor: Colors.grey[colorShade + 100] ?? Colors.grey,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(radius ?? 0.0)),
        ));
  }
}
