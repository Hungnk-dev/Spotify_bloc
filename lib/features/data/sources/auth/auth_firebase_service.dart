import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_bloc/features/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/features/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq user);

  Future<Either> signIn(SigninUserReq user);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  AuthFirebaseServiceImpl();

  @override
  Future<Either> signUp(CreateUserReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);

      await FirebaseFirestore.instance.collection('Users').add(
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
}
