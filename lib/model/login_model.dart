class User {
  final String identificationNumber;
  final String password;
  final bool isAdmin;

  User({
    required this.identificationNumber,
    required this.password,
    required this.isAdmin,
  });
}

final listOfUsers = <User>[
  User(identificationNumber: '07065107877', password: 'adeseha', isAdmin: true),
  User(identificationNumber: '09064081032', password: 'gusanu', isAdmin: true),
  User(identificationNumber: '09084492472', password: 'matthew', isAdmin: true),
  User(identificationNumber: '07011928691', password: 'aderiye', isAdmin: true),
  User(
      identificationNumber: '2018705010173',
      password: 'gusanu',
      isAdmin: false),
  User(
      identificationNumber: '2018235020010',
      password: 'adeseha',
      isAdmin: false),
  User(
      identificationNumber: '2018705010048',
      password: 'aderiye',
      isAdmin: false),
];
