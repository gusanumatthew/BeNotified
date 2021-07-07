import '../features/shared/models/enums.dart';
import '../features/shared/models/user.dart';

class UserData {
  static const users = <User>[
    User(
      fullName: "Developer Matt",
      identificationNumber: "2018701510173",
      level: Level.ND2,
      program: Program.DPP,
      role: Role.Student,
    ),
    User(
      fullName: "Developer Jamiu",
      identificationNumber: "2018701510173",
      level: Level.HND2,
      program: Program.DPP,
      role: Role.Student,
    ),
    User(
      fullName: "Oluwatosin Ben",
      identificationNumber: "2015235020002",
      level: Level.HND2,
      program: Program.FullTime,
      role: Role.ClassRep,
    ),
    User(
      fullName: "Adepoju Ife",
      identificationNumber: "2015235020001",
      level: Level.HND2,
      program: Program.DPP,
      role: Role.ClassRep,
    ),
    User(
      fullName: "Matthew Adegbola",
      identificationNumber: "100",
      level: Level.HND2,
      program: Program.DPP,
      role: Role.Coordinator,
    ),
    User(
      fullName: "Orioke Mrs",
      identificationNumber: "400",
      level: Level.HND2,
      program: Program.FullTime,
      role: Role.Coordinator,
    ),
    User(
      fullName: "Nurse Babalola",
      identificationNumber: "200",
      level: Level.ND2,
      program: Program.FullTime,
      role: Role.Coordinator,
    ),
    User(
      fullName: "Iya Ibitowa",
      identificationNumber: "300",
      level: Level.ND2,
      program: Program.DPP,
      role: Role.Coordinator,
    ),
  ];
}
