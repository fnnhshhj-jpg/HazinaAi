import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Joriy foydalanuvchi
  User? get currentUser => _auth.currentUser;

  // Auth holatini kuzatish
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Email orqali ro'yxatdan o'tish
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Email orqali kirish
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Chiqish
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Parolni tiklash
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}