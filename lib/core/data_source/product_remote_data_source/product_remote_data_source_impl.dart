import 'package:dartz/dartz.dart';
import 'package:tezda/core/data_source/product_remote_data_source/product_remote_data_source.dart';
import 'package:tezda/core/exceptions/auth_exception.dart';
import 'package:tezda/core/models/category_response.dart';
import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/utils/exports.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, List<ProductResponse>>> getAllProducts({int? categoryId}) async {
    final Map<String, dynamic> params = {
      'categoryId': categoryId,
    };
    try {
      final FormattedResponse raw =
          await _httpService.getHttp('products', params: params);
      if (raw.success) {
        List<ProductResponse> temp = [];
        raw.data
            .forEach((e) => temp.add(ProductResponse.fromJson(e)));
        return Right(temp);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.data['errors'] ??
                raw.responseCodeError ??
                'An Error Occured') as String));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on AuthException catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    } catch (e) {
      return const Left(AppError(
          errorType: AppErrorType.api,
          message: 'An error occurred. Please try again'));
    }
  }

   @override
  Future<Either<AppError, List<CategoryResponse>>> getAllCategories() async {
    try {
     
      final FormattedResponse raw =
          await _httpService.getHttp('categories');
      if (raw.success) {
        List<CategoryResponse> temp = [];
        raw.data
            .forEach((e) => temp.add(CategoryResponse.fromJson(e)));
        return Right(temp);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.data['errors'] ??
                raw.responseCodeError ??
                'An Error Occured') as String));
      }
    } on NetworkException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on SocketException catch (e) {
      return Left(
          AppError(errorType: AppErrorType.network, message: e.message));
    } on AuthException catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    } catch (e) {
      return const Left(AppError(
          errorType: AppErrorType.api,
          message: 'An error occurred. Please try again'));
    }
  }
}
