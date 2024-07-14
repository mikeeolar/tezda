import 'package:tezda/core/models/authentication_response/profile_response.dart';
import 'package:tezda/core/models/category_response.dart';
import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/services/auth_service.dart';
import 'package:tezda/core/services/product_service/product_service.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/core/utils/store_id.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final StorageService _storageService = locator<StorageService>();
  final UtilityService _utilityService = locator<UtilityService>();
  final ProductService _productService = locator<ProductService>();

  bool get fetchingProducts => _productService.loading;

  List<ProductResponse>? get products => _productService.allProducts;

  List<ProductResponse> get favouriteProducts =>
      _productService.allProducts
          ?.where((product) => product.isFavourite)
          .toList() ??
      [];

  List<CategoryResponse>? get categories => _productService.allCategories;

  ProfileResponse? get user => _authService.userData;
  bool get hideBalance => _storageService.getBool(StoreId.hideBalance) ?? false;

  Future fetchProducts({int? categoryId}) async {
    final res = await _productService.fetchAllProducts(categoryId: categoryId);

    if (!res.$1) {
      if (res.$2 != null) {
        flusher(res.$2!);
      }
      return;
    }
  }

  Future fetchCategories() async {
    setBusy(true);
    await _productService.fetchCategories();
    setBusy(false);
    setOnModelReadyCalled(true);
  }

  int? id = -1;
  void toggleCategory(int? id) {
    this.id = id;
    fetchProducts(categoryId: id);
    notifyListeners();
  }

  void toggleFavourite(ProductResponse product) {
    _productService.toggleFavourite(product);
  }

  void navigateToProductDetail(ProductResponse? product) {
    _navigationService.navigateTo(Routes.productDetil, arguments: product);
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_authService, _utilityService, _productService];
}
