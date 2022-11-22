import 'package:dartz/dartz.dart';
import 'package:github_list/data/other/database_exception.dart';
import 'package:github_list/data/other/failure.dart';
import 'package:github_list/data/response/response.dart';
import 'package:github_list/domain/datasource/user_remote_datasource.dart';
import 'package:github_list/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserResponse>> getUserProcess() async {
    try {
      final result = await userRemoteDataSource.getUserProcess();

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }
}
