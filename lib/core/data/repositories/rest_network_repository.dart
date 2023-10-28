import 'dart:convert';
import 'package:ff_project/core/data/models/post_response_failure.dart';
import 'package:ff_project/network/network_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class RestNetworkRepository implements NetworkRepository {
  static const baseUrl = 'https://interview-backend-3enbou53tq-uc.a.run.app';

  @override
  Future<Either<PostResponseFailure, Map<String, dynamic>>> post(
      {String endpoint = '', required Map<String, dynamic> body}) async {
    try {
      var url = '$baseUrl${endpoint.isNotEmpty ? '/$endpoint' : ''}?';
      var uri = Uri.parse(url);
      var response = await http.post(uri, body: body);
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(PostResponseFailure(error: ex.toString()));
    }
  }
}
