import 'dart:convert';
import 'dart:developer';

import 'package:tdd/data/data.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> userLogin({required UserModel userModel});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> userLogin({required UserModel userModel}) async {
    final url = Uri.https(
        "flutter-tdd-f94ac-default-rtdb.asia-southeast1.firebasedatabase.app",
        'user-list.json');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        userModel.toJson(),
      ),
    );

    final body = jsonDecode(response.body);

    log("${UserModel.fromJson(body)}");

    if (response.statusCode == 200) {
      return UserModel.fromJson(body);
    } else {
      throw Exception("Error!!!");
    }
  }
}
