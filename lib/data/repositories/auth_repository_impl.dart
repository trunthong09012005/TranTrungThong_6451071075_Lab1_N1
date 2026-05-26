import 'package:lab1_mobile_n2/core/errors/exceptions.dart';
import 'package:lab1_mobile_n2/core/errors/failures.dart';
import 'package:lab1_mobile_n2/data/datasources/auth_remote_data_source.dart';
import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';
import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Stream<UserEntity?> get authStateChanges {
    return _remoteDataSource.authStateChanges.map((user) => user?.toEntity());
  }

  @override
  UserEntity? get currentUser => _remoteDataSource.currentUser?.toEntity();

  @override
  Future<AuthResult<UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return (data: user.toEntity(), failure: null);
    } on AuthException catch (e) {
      return (data: null, failure: Failure(message: e.message, code: e.code));
    } catch (_) {
      return (
        data: null,
        failure: const Failure(message: 'Đăng nhập thất bại. Vui lòng thử lại'),
      );
    }
  }

  @override
  Future<AuthResult<UserEntity>> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final user = await _remoteDataSource.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );
      return (data: user.toEntity(), failure: null);
    } on AuthException catch (e) {
      return (data: null, failure: Failure(message: e.message, code: e.code));
    } catch (_) {
      return (
        data: null,
        failure: const Failure(message: 'Đăng ký thất bại. Vui lòng thử lại'),
      );
    }
  }

  @override
  Future<AuthResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await _remoteDataSource.sendPasswordResetEmail(email);
      return (data: null, failure: null);
    } on AuthException catch (e) {
      return (data: null, failure: Failure(message: e.message, code: e.code));
    } catch (_) {
      return (
        data: null,
        failure: const Failure(
          message: 'Gửi email đặt lại mật khẩu thất bại',
        ),
      );
    }
  }

  @override
  Future<void> signOut() => _remoteDataSource.signOut();
}
