import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../features/shared/models/app_user.dart';
import '../features/shared/models/notice.dart';

class NoticeService {
  static final NoticeService _instance = NoticeService._internal();

  NoticeService._internal();

  factory NoticeService() => _instance;

  final noticeCollection = FirebaseFirestore.instance.collection('notice');

  Future<void> createNotice(
    String title,
    String description,
    DateTime deadlineDate,
    TimeOfDay deadlineTime,
    AppUser user,
  ) async {
    final time = DateTime(
      deadlineDate.year,
      deadlineDate.month,
      deadlineDate.day,
      deadlineTime.hour,
      deadlineTime.minute,
    );

    await noticeCollection.add({
      'title': title,
      'description': description,
      'deadlineDate': deadlineDate.toIso8601String(),
      'startTime': deadlineDate.toIso8601String(),
      'deadlineTime': time.toIso8601String(),
      'role': user.role.index,
      'level': user.level.index,
      'program': user.program.index,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<List<Notice>> getClassRepNotice(AppUser user) {
    return noticeCollection
        .where('role', isEqualTo: 2)
        .where('level', isEqualTo: user.level.index)
        .where('program', isEqualTo: user.program.index)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
              .map(
                (queryDocumentSnapshot) => Notice.fromDocumentSnapshot(
                  queryDocumentSnapshot,
                ),
              )
              .toList(),
        );
  }

  Stream<List<Notice>> getCoordinatorNotice(AppUser user) {
    return noticeCollection
        .where('role', isEqualTo: 1)
        .where('level', isEqualTo: user.level.index)
        .where('program', isEqualTo: user.program.index)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
              .map(
                (queryDocumentSnapshot) => Notice.fromDocumentSnapshot(
                  queryDocumentSnapshot,
                ),
              )
              .toList(),
        );
  }
}
