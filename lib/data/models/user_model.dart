import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab1_mobile_n2/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.displayName,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        displayName: displayName,
      );
}
