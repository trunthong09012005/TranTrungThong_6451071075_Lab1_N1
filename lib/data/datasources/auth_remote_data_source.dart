import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab1_mobile_n2/core/errors/exceptions.dart';
import 'package:lab1_mobile_n2/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<UserModel?> get authStateChanges;

  UserModel? get currentUser;

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();
}

class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  FirebaseAuthRemoteDataSource({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      return user == null ? null : UserModel.fromFirebaseUser(user);
    });
  }

  @override
  UserModel? get currentUser {
    final user = _firebaseAuth.currentUser;
    return user == null ? null : UserModel.fromFirebaseUser(user);
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthException(message: 'Đăng nhập thất bại');
      }
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _mapFirebaseMessage(e), code: e.code);
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthException(message: 'Đăng ký thất bại');
      }
      if (displayName != null && displayName.isNotEmpty) {
        await user.updateDisplayName(displayName);
        await user.reload();
      }
      final refreshed = _firebaseAuth.currentUser ?? user;
      return UserModel.fromFirebaseUser(refreshed);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _mapFirebaseMessage(e), code: e.code);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _mapFirebaseMessage(e), code: e.code);
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  String _mapFirebaseMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Email không hợp lệ';
      case 'user-disabled':
        return 'Tài khoản đã bị vô hiệu hóa';
      case 'user-not-found':
        return 'Không tìm thấy tài khoản với email này';
      case 'wrong-password':
        return 'Mật khẩu không đúng';
      case 'invalid-credential':
        return 'Email hoặc mật khẩu không đúng';
      case 'email-already-in-use':
        return 'Email đã được đăng ký';
      case 'weak-password':
        return 'Mật khẩu quá yếu (tối thiểu 6 ký tự)';
      case 'operation-not-allowed':
        return 'Phương thức đăng nhập chưa được bật trên Firebase Console';
      case 'too-many-requests':
        return 'Quá nhiều lần thử. Vui lòng thử lại sau';
      default:
        return e.message ?? 'Đã xảy ra lỗi xác thực';
    }
  }
}
