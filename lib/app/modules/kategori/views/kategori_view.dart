import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  KategoriView({Key? key}) : super(key: key);
  final KategoriController controller = Get.put(KategoriController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 20),
            onPressed: () => Get.toNamed('/kategori/create'),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.KategoriList.length,
          itemBuilder: (context, index) {
            final item = controller.KategoriList[index];
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
                  item.namaKategori ?? 'No Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                subtitle: Text(
                  item.slug ?? '',
                  style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.deepPurpleAccent),
                      onPressed: () => Get.toNamed('/kategori/edit', arguments: item),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteKategori(item.id!),
                    ),
                  ]
                  ),
                  onTap: () => Get.toNamed('/kategori/show', arguments: item,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
