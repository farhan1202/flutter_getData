import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<User?> getUser() async {
    final response = await get('https://reqres.in/api/users?page=2');
    if ((response.body["data"] as List).length == 0) {
      return null;
    }

    print(response.body["data"]);
    // List<Datum> users = [];
    // (response.body['data'] as List).forEach((element) {
    //   users.add(Datum.fromJson(element));
    // });
    User user;
    user = User.fromJson(response.body);

    // final user = userFromJson(response.body);
    return user;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
