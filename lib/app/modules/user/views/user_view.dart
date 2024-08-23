import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/user/controllers/user_controller.dart';


class UserView extends GetView<UserController> {
  UserView({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 20),
            onPressed: () => Get.toNamed('/user/create'),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 68, 0, 255),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.UserList.length,
          itemBuilder: (context, index) {
            final item = controller.UserList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                title: Text(
                  item.name ?? 'No Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                subtitle: Text(
                  item.email ?? '',
                  style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.deepPurpleAccent),
                      onPressed: () => Get.toNamed('/user/edit', arguments: item),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteUser(item.id!),
                    ),
                  ]
                  ),
                  onTap: () => Get.toNamed('/user/show', arguments: item,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
