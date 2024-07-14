import 'package:tezda/core/data_source/product_remote_data_source/product_remote_data_source.dart';
import 'package:tezda/core/models/category_response.dart';
import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/utils/exports.dart';

class ProductService with ListenableServiceMixin {
  final ProductRemoteDataSource _productRemoteDataSource =
      locator<ProductRemoteDataSource>();

  bool _loading = true;
  bool get loading => _loading;
  set loading(bool val) {
    _loading = val;
    notifyListeners();
  }

  List<ProductResponse>? _allProducts;
  List<ProductResponse>? get allProducts => _allProducts;
  set allProducts(List<ProductResponse>? val) {
    _allProducts = val;
    notifyListeners();
  }

  List<CategoryResponse>? _allCategories;
  List<CategoryResponse>? get allCategories => _allCategories;
  set allCategories(List<CategoryResponse>? val) {
    _allCategories = val;
    notifyListeners();
  }

  Future<(bool, String?)> fetchAllProducts({int? categoryId}) async {
    loading = true;
    notifyListeners();

    bool status = false;
    String? error;
    final data =
        await _productRemoteDataSource.getAllProducts(categoryId: categoryId);

    data.fold((l) {
      status = false;
      error = l.message;
      loading = false;
      notifyListeners();
    }, (r) {
      _allProducts = r;
      status = true;
      loading = false;
      notifyListeners();
    });

    return (status, error);
  }

  Future fetchCategories() async {
    final data = await _productRemoteDataSource.getAllCategories();

    data.fold((l) {
      flusher(l.message, color: Colors.redAccent);
    }, (r) {
      _allCategories = r;
      notifyListeners();
    });
  }

  List<ProductResponse>? _favoriteProduct;
  List<ProductResponse>? get favoriteProduct => _favoriteProduct;
  set favoriteProduct(List<ProductResponse>? val) {
    _favoriteProduct = val;
    notifyListeners();
  }

  void toggleFavourite(ProductResponse product) {
    final existingProduct = _allProducts?.firstWhere((p) => p.id == product.id);
    if (existingProduct != null) {
      existingProduct.isFavourite = !existingProduct.isFavourite;
    } else {
      _allProducts?.add(product.copyWith(isFavourite: false));
    }

    notifyListeners(); // Inform widgets of the change
  }

  ProductService() {
    listenToReactiveValues([
      _allProducts,
      _allCategories,
    ]);
  }
}
