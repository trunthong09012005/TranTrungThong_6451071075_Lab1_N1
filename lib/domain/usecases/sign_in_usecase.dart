import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';
import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';

class SignInUseCase {
  const SignInUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthResult<UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repository.signIn(email: email.trim(), password: password);
  }
}
