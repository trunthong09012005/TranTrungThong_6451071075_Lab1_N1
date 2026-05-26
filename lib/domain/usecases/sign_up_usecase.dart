import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';
import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthResult<UserEntity>> call({
    required String email,
    required String password,
    String? displayName,
  }) {
    return _repository.signUp(
      email: email.trim(),
      password: password,
      displayName: displayName?.trim(),
    );
  }
}
