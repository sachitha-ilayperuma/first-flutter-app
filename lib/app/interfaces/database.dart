import 'package:first_flutter_app/app/home/models/job.dart';

abstract class Database{
  Future<void> setJob(Job job);
  Stream<List<Job>> jobsStream();
  Future<void> deleteJob(Job job);
}