import 'package:spotify_bloc/features/domain/entites/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;

  UserModel({
    this.fullName,
    this.email,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['name'],
      email: json['email'],
      imageUrl: json['imageUrl'],
    );
  }
}

extension UserModelLX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName ?? '',
      email: email ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
