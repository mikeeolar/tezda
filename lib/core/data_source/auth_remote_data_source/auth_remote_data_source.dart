import 'package:dartz/dartz.dart';
import 'package:tezda/core/models/authentication_response/authentication_response.dart';
import 'package:tezda/core/models/authentication_response/profile_response.dart';
import 'package:tezda/core/utils/exports.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppError, ProfileResponse>> createUser({
    required String? name,
    required String? password,
    required String? email,
  });

  Future<Either<AppError, AuthenticationResponse>> refreshToken({
    required String? refreshToken,
  });

  Future<Either<AppError, dynamic>> updateUserAccount({
    String? name,
    String? email,
    String? avatar,
    required int? id
  });

  Future<Either<AppError, AuthenticationResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<AppError, ProfileResponse>> fetchUserDetails();

  Future<Either<AppError, ProfileResponse>> getUser(int id);
}
