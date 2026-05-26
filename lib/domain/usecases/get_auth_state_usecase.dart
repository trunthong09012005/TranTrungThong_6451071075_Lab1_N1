import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';
import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';

class GetAuthStateUseCase {
  const GetAuthStateUseCase(this._repository);

  final AuthRepository _repository;

  Stream<UserEntity?> call() => _repository.authStateChanges;

  UserEntity? get currentUser => _repository.currentUser;
}
