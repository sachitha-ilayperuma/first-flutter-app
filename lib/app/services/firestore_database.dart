import 'package:first_flutter_app/app/home/models/job.dart';
import 'package:first_flutter_app/app/interfaces/database.dart';
import 'package:first_flutter_app/app/services/api_path.dart';
import 'package:first_flutter_app/app/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FireStoreDatabase implements Database {
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  final _service = FireStoreService.instance;

  final String uid;
  @override
  Future<void> setJob(Job job) async =>
      await _service.setData(path: APIPath.job(uid, job.id), data: job.toMap());

  @override
  Future<void> deleteJob(Job job) async => await _service.deleteData(
        path: APIPath.job(uid, job.id),
      );

  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid),
      builder: (data, documentId) => Job.fromMap(data, documentId));
}
