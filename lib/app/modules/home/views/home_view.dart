import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All User'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: Text("Loading.."));
            if (controller.users.length == 0)
              return Center(child: Text("Tidak Ada Data.."));
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(controller.users[index].avatar!),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID : ${controller.users[index].id}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Name :  ${controller.users[index].firstName} ${controller.users[index].lastName}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Email : ${controller.users[index].email}"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
