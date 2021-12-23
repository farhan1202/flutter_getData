import 'package:flutter_get/app/data/models/user_model.dart';
import 'package:flutter_get/app/data/models/user_model.dart';
import 'package:flutter_get/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<Datum> users = List<Datum>.empty().obs;
  Rx<User> user = User().obs;

  UserProvider userProvider = UserProvider();

  Future<void> getUserData() async {
    var datas = await userProvider.getUser();
    // user = datas as Rx<User>;
    if (datas!.data != null) {
      datas.data!.forEach((element) {
        users.add(element);
      });
      users.refresh();
    }
  }
}
