import 'package:shimmer/shimmer.dart';
import 'package:tezda/core/utils/exports.dart';

class ProductsLoader extends StatelessWidget {
  const ProductsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
