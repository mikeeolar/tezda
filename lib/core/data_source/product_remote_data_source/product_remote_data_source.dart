import 'package:dartz/dartz.dart';
import 'package:tezda/core/models/category_response.dart';
import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/utils/exports.dart';

abstract class ProductRemoteDataSource {
  Future<Either<AppError, List<ProductResponse>>> getAllProducts({int? categoryId});

  Future<Either<AppError, List<CategoryResponse>>> getAllCategories();
}
