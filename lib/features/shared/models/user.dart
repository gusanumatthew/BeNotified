import 'enums.dart';

class User {
  final String fullName;
  final String identificationNumber;
  final Level level;
  final Program program;
  final Role role;

  const User({
    required this.fullName,
    required this.identificationNumber,
    required this.level,
    required this.program,
    required this.role,
  });
}
