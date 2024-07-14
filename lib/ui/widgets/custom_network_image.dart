import 'package:cached_network_image/cached_network_image.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.borderRadius,
    this.imageUrl,
  });

  final String? imageUrl;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? 'http://via.placeholder.com/150x200',
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[350]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 180.w,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Image.asset(
          'onbg'.png,
          height: 220.h,
          width: 150.w,
        ),
      ),
    );
  }
}
