import 'package:dartz/dartz.dart';
import 'package:studenda_mobile_student/core/data/error/failure.dart';
import 'package:studenda_mobile_student/feature/journal/data/model/api/session_request_model.dart';
import 'package:studenda_mobile_student/feature/journal/data/model/attendancy/session_model.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionModel>>> loadStudent(
    SessionRequestModel request, [
    bool remote = true,
  ]);
  Future<Either<Failure, List<SessionModel>>> loadTeacher(
    SessionRequestModel request, [
    bool remote = true,
  ]);
}
