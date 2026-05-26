import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  const ResetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthResult<void>> call(String email) {
    return _repository.sendPasswordResetEmail(email.trim());
  }
}
