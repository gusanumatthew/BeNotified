import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/shared/models/app_user.dart';

class UserService {
  static final UserService _instance = UserService._internal();

  UserService._internal();

  factory UserService() => _instance;

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<AppUser> getUserWithId(String userId) async {
    final snapshot = await userCollection.doc(userId).get();
    return AppUser.fromMap(snapshot.data()!);
  }

  Future<void> createUserWithId(
    String userId, {
    required String fullName,
    required String identificationNumber,
    required int level,
    required int program,
    required int role,
  }) async {
    final userCollection = FirebaseFirestore.instance.collection('users');

    return await userCollection.doc(userId).set({
      'fullName': fullName,
      'identificationNumber': identificationNumber,
      'level': level,
      'program': program,
      'role': role,
      'timestamp': Timestamp.now(),
    });
  }
}
