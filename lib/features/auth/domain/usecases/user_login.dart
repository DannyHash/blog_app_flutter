import 'package:blog_app_flutter/core/error/failures.dart';
import 'package:blog_app_flutter/core/usecase/usecase.dart';
import 'package:blog_app_flutter/features/auth/domain/entities/user.dart';
import 'package:blog_app_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    // TODO: implement call
    return await authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
