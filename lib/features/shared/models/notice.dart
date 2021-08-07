import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'enums.dart';

class Notice {
  final String id;
  final String title;
  final String description;
  final DateTime deadlineDate;
  final TimeOfDay deadlineTime;
  final Timestamp timestamp;
  final Role role;
  final Level level;
  final Program program;

  Notice({
    required this.id,
    required this.title,
    required this.description,
    required this.deadlineDate,
    required this.deadlineTime,
    required this.timestamp,
    required this.role,
    required this.level,
    required this.program,
  });

  factory Notice.fromDocumentSnapshot(
          QueryDocumentSnapshot<Map<String, dynamic>> snapshot) =>
      Notice(
        id: snapshot.id,
        title: snapshot.data()['title'],
        description: snapshot.data()['description'],
        deadlineDate: DateTime.parse(snapshot.data()['deadlineDate']),
        deadlineTime: TimeOfDay.fromDateTime(
            DateTime.parse(snapshot.data()['deadlineTime'])),
        role: Role.values[snapshot.data()['role']],
        level: Level.values[snapshot.data()['level']],
        program: Program.values[snapshot.data()['program']],
        timestamp: snapshot.data()['timestamp'],
      );
}
