import 'package:lab1_mobile_n2/core/errors/failures.dart';
import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';

typedef AuthResult<T> = ({T? data, Failure? failure});

abstract class AuthRepository {
  Stream<UserEntity?> get authStateChanges;

  UserEntity? get currentUser;

  Future<AuthResult<UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<AuthResult<UserEntity>> signUp({
    required String email,
    required String password,
    String? displayName,
  });

  Future<AuthResult<void>> sendPasswordResetEmail(String email);

  Future<void> signOut();
}
