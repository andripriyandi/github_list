import 'package:dartz/dartz.dart';
import 'package:github_list/data/other/failure.dart';
import 'package:github_list/data/response/response.dart';
import 'package:github_list/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({
    required this.userRepository,
  });

  Future<Either<Failure, UserResponse>> getUserProcess() {
    return userRepository.getUserProcess();
  }
}
