import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> signInWithGoogle() async {
    final _googleSignInAccount = await _googleSignIn.signIn();

    final _googleSignInAuthentication =
        await _googleSignInAccount.authentication;

    final _authCredential = GoogleAuthProvider.credential(
      accessToken: _googleSignInAuthentication.accessToken,
      idToken: _googleSignInAuthentication.idToken,
    );

    final _authResult =
        await _firebaseAuth.signInWithCredential(_authCredential);

    final _user = _authResult.user;

    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);

    return _user;
  }

  Future<void> signOutWithGoogle() async {
    await _googleSignIn.signOut();
  }
}
