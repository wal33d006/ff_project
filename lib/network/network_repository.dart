import 'package:ff_project/core/data/models/post_response_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class NetworkRepository {
  Future<Either<PostResponseFailure, Map<String, dynamic>>> post({
    String endpoint = '',
    required Map<String, dynamic> body,
  });
}
