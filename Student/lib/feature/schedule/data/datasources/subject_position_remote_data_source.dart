import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studenda_mobile_student/core/data/error/exception.dart';
import 'package:studenda_mobile_student/feature/schedule/data/models/subject_position_model.dart';

abstract class SubjectPositionRemoteDataSource {
  Future<List<SubjectPositionModel>> load(void request);
}

class SubjectPositionRemoteDataSourceImpl implements SubjectPositionRemoteDataSource {
  final http.Client client;

  SubjectPositionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SubjectPositionModel>> load(void request) async {
    try {
      final response = await client.get(
        Uri.parse('http://88.210.3.137/api/schedule/day-position/all'),
      );
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body) as List<dynamic>;
        final responseModel = decoded
            .map((dynamic value) =>
                SubjectPositionModel.fromJson(value as Map<String, dynamic>),)
            .toList();
        return responseModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
