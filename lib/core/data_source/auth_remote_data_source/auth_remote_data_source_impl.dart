import 'package:dartz/dartz.dart';
import 'package:tezda/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:tezda/core/exceptions/auth_exception.dart';
import 'package:tezda/core/models/authentication_response/authentication_response.dart';
import 'package:tezda/core/models/authentication_response/profile_response.dart';
import 'package:tezda/core/utils/exports.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final HttpService _httpService = locator<HttpService>();

  @override
  Future<Either<AppError, ProfileResponse>> createUser({
    String? name,
    String? password,
    String? email,
  }) async {
    final Map<String, dynamic> payload = {
      'name': name,
      'email': email,
      'password': password,
      'avatar': 'https://api.lorem.space/image/face?w=640&h=480&r=867'
    };

    try {
      final FormattedResponse raw =
          await _httpService.postHttp('users', payload);
      if (raw.success) {
        ProfileResponse res = ProfileResponse.fromJson(raw.data);
        return Right(res);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
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
  Future<Either<AppError, AuthenticationResponse>> refreshToken(
      {required String? refreshToken}) async {
    final Map<String, dynamic> payload = {
      'refreshToken': refreshToken
    };

    try {
      final FormattedResponse raw =
          await _httpService.postHttp('auth/refresh-token', payload);
      if (raw.success) {
        AuthenticationResponse res = AuthenticationResponse.fromJson(raw.data);
        return Right(res);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
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
  Future<Either<AppError, dynamic>> updateUserAccount({
     String? name,
     String? email,
     String? avatar,
     required int? id
  }) async {
    final Map<String, dynamic> payload = {
      'name': name,
      'email': email,
      'avatar': avatar
    };

    try {
      final FormattedResponse raw =
          await _httpService.putHttp('users/$id', payload);
      if (raw.success) {
        return Right(raw.data);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
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
  Future<Either<AppError, AuthenticationResponse>> login({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> payload = {
      'email': email,
      'password': password,
    };

    try {
      final FormattedResponse raw =
          await _httpService.postHttp('auth/login', payload);
      if (raw.success) {
        final AuthenticationResponse res =
            AuthenticationResponse.fromJson(raw.data as Map<String, dynamic>);
        return Right(res);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
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
      Logger.e('Login Error', e: e, s: (e as Error).stackTrace);
      return const Left(AppError(
          errorType: AppErrorType.api,
          message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<AppError, ProfileResponse>> fetchUserDetails() async {
    try {
      final FormattedResponse raw =
          await _httpService.getHttp('auth/profile');
      if (raw.success) {
        final ProfileResponse res =
            ProfileResponse.fromJson(raw.data as Map<String, dynamic>);
        return Right(res);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
                'An Error Occured') as String));
      }
    } on NetworkException catch (e) {
      return Left(AppError(
          errorType: AppErrorType.network,
          message: e.message,
          deviceRegistered: e.deviceRegistered));
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
  Future<Either<AppError, ProfileResponse>> getUser(int id) async {
    try {
      final FormattedResponse raw =
          await _httpService.getHttp('user/$id');
      if (raw.success) {
        final ProfileResponse res =
            ProfileResponse.fromJson(raw.data as Map<String, dynamic>);
        return Right(res);
      } else {
        return Left(AppError(
            errorType: AppErrorType.network,
            message: (raw.errors ??
                raw.data['message'] ??
                raw.data['title'] ??
                'An Error Occured') as String));
      }
    } on NetworkException catch (e) {
      return Left(AppError(
          errorType: AppErrorType.network,
          message: e.message,
          deviceRegistered: e.deviceRegistered));
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
