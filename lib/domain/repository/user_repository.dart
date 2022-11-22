import 'package:github_list/data/other/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:github_list/data/response/response.dart';

abstract class UserRepository {
  Future<Either<Failure, UserResponse>> getUserProcess();
}
