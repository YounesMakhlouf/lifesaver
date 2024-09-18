import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // Singleton pattern
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();

  factory FirebaseAuthService() => _instance;

  FirebaseAuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'Cet e-mail est déjà utilisé. Veuillez en utiliser un autre.';
          break;
        case 'invalid-email':
          errorMessage = 'L\'adresse e-mail est invalide.';
          break;
        case 'weak-password':
          errorMessage = 'Le mot de passe est trop faible.';
          break;
        default:
          errorMessage = 'Une erreur est survenue lors de l\'inscription.';
          break;
      }
      throw FirebaseAuthException(message: errorMessage, code: e.code);
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Aucun utilisateur trouvé avec cet e-mail.';
          break;
        case 'wrong-password':
          errorMessage = 'Mot de passe incorrect.';
          break;
        case 'invalid-email':
          errorMessage = 'L\'adresse e-mail est invalide.';
          break;
        case 'user-disabled':
          errorMessage = 'Ce compte utilisateur a été désactivé.';
          break;
        default:
          errorMessage = 'Une erreur est survenue lors de la connexion.';
          break;
      }
      throw FirebaseAuthException(message: errorMessage, code: e.code);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'L\'adresse e-mail est invalide.';
          break;
        case 'user-not-found':
          errorMessage = 'Aucun utilisateur trouvé avec cet e-mail.';
          break;
        default:
          errorMessage =
              'Une erreur est survenue lors de la réinitialisation du mot de passe.';
          break;
      }
      throw FirebaseAuthException(message: errorMessage, code: e.code);
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
