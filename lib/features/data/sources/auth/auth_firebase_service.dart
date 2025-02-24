import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_bloc/core/configs/constants/app_urls.dart';
import 'package:spotify_bloc/features/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/features/data/models/auth/signin_user_req.dart';
import 'package:spotify_bloc/features/data/models/auth/user_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq user);

  Future<Either> signIn(SigninUserReq user);

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  AuthFirebaseServiceImpl();

  @override
  Future<Either> signUp(CreateUserReq user) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);

      await FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set(
        {
          'name': user.fullName,
          'email': data.user?.email,
        },
      );

      return const Right('Signed up successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'email-already-in-use') {
        message = 'An account already exists for that email';
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak';
      } else {
        message = e.message ?? 'An error occurred';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signIn(SigninUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password);

      return const Right('Signed In successful');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'No user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong email or password';
      } else {
        message = e.message ?? 'An error occurred';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const Left('User not found');
      }
      final data = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();

      final userModel = UserModel.fromJson(data.data()!);
      userModel.imageUrl = user.photoURL ?? AppUrls.avatarDefault;
      final userEntity = userModel.toEntity();

      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'An error occurred');
    }
  }
}
