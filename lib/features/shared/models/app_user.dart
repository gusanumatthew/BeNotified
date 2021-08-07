import 'enums.dart';

class AppUser {
  final String fullName;
  final String identificationNumber;
  final Level level;
  final Program program;
  final Role role;

  const AppUser({
    required this.fullName,
    required this.identificationNumber,
    required this.level,
    required this.program,
    required this.role,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        fullName: map['fullName'],
        identificationNumber: map['identificationNumber'],
        level: Level.values[map['level']],
        program: Program.values[map['program']],
        role: Role.values[map['role']],
      );
}
