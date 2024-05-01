import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  // get instance of FirebaseAuth & FireStore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // sign in
  Future<UserCredential> signIn(String email, String password) async {
    try {
      // sign user in
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user to FireStore if it doesn't already exist
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'email': email,
        'uid': credential.user!.uid,
      });

      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUp(String email, String password) async {
    try {
      // create user
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add user to FireStore
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'email': email,
        'uid': credential.user!.uid,
      });

      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
