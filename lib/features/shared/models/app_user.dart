import 'package:cloud_firestore/cloud_firestore.dart';

import 'enums.dart';

class AppUser {
  final String id;
  final String fullName;
  final String identificationNumber;
  final Level level;
  final Program program;
  final Role role;

  const AppUser({
    required this.id,
    required this.fullName,
    required this.identificationNumber,
    required this.level,
    required this.program,
    required this.role,
  });

  factory AppUser.fromMap(DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      AppUser(
        id: snapshot.id,
        fullName: snapshot.data()!['fullName'],
        identificationNumber: snapshot.data()!['identificationNumber'],
        level: Level.values[snapshot.data()!['level']],
        program: Program.values[snapshot.data()!['program']],
        role: Role.values[snapshot.data()!['role']],
      );
}
