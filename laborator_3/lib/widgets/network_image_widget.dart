import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
  });

  bool _isSvg(String url) {
    return url.toLowerCase().endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    if (_isSvg(imageUrl)) {
      return SvgPicture.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (context) =>
            placeholder ??
            Container(
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
        // ignore: deprecated_member_use
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
            Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
      );
    } else {
      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ??
              Container(
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              );
        },
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ??
              Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              );
        },
      );
    }
  }
}
