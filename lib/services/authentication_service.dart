import 'package:firebase_auth/firebase_auth.dart';

import '../features/shared/models/enums.dart';
import '../features/shared/models/app_user.dart';
import 'user_service.dart';

class AuthenticationService {
  static final AuthenticationService _instance =
      AuthenticationService._internal();

  AuthenticationService._internal();

  factory AuthenticationService() => _instance;

  final _auth = FirebaseAuth.instance;
  final _userService = UserService();

  User? get getUser => _auth.currentUser;

  Future<AppUser> register({
    required String fullName,
    required String identificationNumber,
    required Level level,
    required Program program,
    required Role role,
    required String password,
  }) async {
    UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(
      email: '$identificationNumber@benotified.com',
      password: password,
    );

    final _userId = _userCredential.user!.uid;

    await _userService.createUserWithId(
      _userId,
      fullName: fullName,
      identificationNumber: identificationNumber,
      level: level.index,
      program: program.index,
      role: role.index,
    );

    return _userService.getUserWithId(_userId);
  }

  Future<AppUser> login({
    required String identificationNumber,
    required String password,
  }) async {
    UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
      email: '$identificationNumber@benotified.com',
      password: password,
    );

    return _userService.getUserWithId(_userCredential.user!.uid);
  }

  Future<void> logout() async => await _auth.signOut();
}
