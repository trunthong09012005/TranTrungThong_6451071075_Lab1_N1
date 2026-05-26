import 'package:lab1_mobile_n2/data/datasources/auth_remote_data_source.dart';
import 'package:lab1_mobile_n2/data/repositories/auth_repository_impl.dart';
import 'package:lab1_mobile_n2/domain/repositories/auth_repository.dart';
import 'package:lab1_mobile_n2/domain/usecases/get_auth_state_usecase.dart';
import 'package:lab1_mobile_n2/domain/usecases/reset_password_usecase.dart';
import 'package:lab1_mobile_n2/domain/usecases/sign_in_usecase.dart';
import 'package:lab1_mobile_n2/domain/usecases/sign_up_usecase.dart';

/// Dependency injection đơn giản cho Clean Architecture.
class Injection {
  Injection._();

  static final Injection instance = Injection._();

  late final AuthRepository authRepository;
  late final SignInUseCase signInUseCase;
  late final SignUpUseCase signUpUseCase;
  late final ResetPasswordUseCase resetPasswordUseCase;
  late final GetAuthStateUseCase getAuthStateUseCase;

  void init() {
    final remoteDataSource = FirebaseAuthRemoteDataSource();
    authRepository = AuthRepositoryImpl(remoteDataSource);
    signInUseCase = SignInUseCase(authRepository);
    signUpUseCase = SignUpUseCase(authRepository);
    resetPasswordUseCase = ResetPasswordUseCase(authRepository);
    getAuthStateUseCase = GetAuthStateUseCase(authRepository);
  }
}
