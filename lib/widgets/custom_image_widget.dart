import '../core/app_export.dart';

class CustomImageWidget extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;

  const CustomImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, width: width, height: height, fit: BoxFit.cover);
  }
}
