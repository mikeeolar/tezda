import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/services/product_service/product_service.dart';
import 'package:tezda/core/utils/exports.dart';

class ProductDetailViewModel extends IndexTrackingViewModel {
  final PageController pageController = PageController();
  final ProductService _productService = locator<ProductService>();

  int activeIndex = 0;

  void toggleFavourite(ProductResponse product) {
    _productService.toggleFavourite(product);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productService];
}
