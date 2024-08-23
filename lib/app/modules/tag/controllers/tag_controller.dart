import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/app/data/tag_model.dart';
import 'dart:convert';

import '../../../data/tag_model.dart';
import '../../../utils/api.dart';

class TagController extends GetxController {
  var tagList = <DataTag>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/tag';

  @override
  void onInit() {
    fetchTags();
    super.onInit();
  }

  // Fetch kategori
  void fetchTags() async {
  try {
    isLoading(true);
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var tag = Tag.fromJson(jsonResponse);
      tagList.value = tag.dataTag!;  
    } else {
      Get.snackbar("Error", "Failed to fetch tag");
    }
  } catch (e) {
    Get.snackbar("Error", "Failed to fetch tag: $e");
  } finally {
    isLoading(false);
  }
}


  // Add kategori
  Future<void> addTag(DataTag newTag) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newTag.toJson()),
      );
      if (response.statusCode == 201) {
        fetchTags();
        Get.back();
        Get.snackbar("Success", "Tag added successfully");
      } else {
        Get.snackbar("Error", "Failed to add tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add tag: $e");
    } finally {
      isLoading(false);
    }
  }

  // Update kategori
  Future<void> updateTag(int id, DataTag updatedTag) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedTag.toJson()),
      );
      if (response.statusCode == 200) {
        fetchTags();
        Get.back();
        Get.snackbar("Success", "Category updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update category");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update category: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete kategori
  Future<void> deleteTag(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchTags();
        Get.snackbar("Success", "Tag deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete tag");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete tags: $e");
    } finally {
      isLoading(false);
    }
  }
}