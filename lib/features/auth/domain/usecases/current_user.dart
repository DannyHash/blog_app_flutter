import 'package:blog_app_flutter/core/error/failures.dart';
import 'package:blog_app_flutter/core/usecase/usecase.dart';
import 'package:blog_app_flutter/features/auth/domain/entities/user.dart';
import 'package:blog_app_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    // TODO: implement call
    return await authRepository.currentUser();
  }
}
