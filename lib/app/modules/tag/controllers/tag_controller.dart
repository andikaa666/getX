import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/app/data/tag_model.dart';
import 'package:myapp/app/utils/api.dart';

class TagController extends GetxController {
  var TagList = <DataTag>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/tag';

  @override
  void onInit() {
    fetchTag();
    super.onInit();
  }

  void fetchTag() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var tag = Tag.fromJson(jsonResponse);
        TagList.value = tag.data!;
      } else {
        Get.snackbar('Error', 'Failed to load tag');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tag: $e');
    } finally {
      isLoading(false);
    }
  }

  // Add Kategori
  Future<void> addTag(DataTag newTag) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newTag.toJson()),
      );
      if (response.statusCode == 201) { // Status code 201 indicates successful creation
        fetchTag();
        Get.back();
        Get.snackbar('Success', 'Tag added successfully');
      } else {
        Get.snackbar('Error', 'Failed to add Tag: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add Tag: $e');
    } finally {
      isLoading(false);
    }
  }

  // Update Kategori
Future<void> updateTag(int id, DataTag updatedTag) async {
  try {
    isLoading(true);
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedTag.toJson()),
    );
    
    if (response.statusCode == 200 || response.statusCode == 204) {
      // Status code 200 or 204 indicates success
      fetchTag();
      Get.back();
      Get.snackbar('Success', 'Kategori updated successfully');
    } else {
      // Print the response body to understand what went wrong
      print('Response body: ${response.body}');
      Get.snackbar('Error', 'Failed to update Kategori: ${response.reasonPhrase}');
    }
  } catch (e) {
    // Print the error for debugging purposes
    print('Error: $e');
    Get.snackbar('Error', 'Failed to update Kategori: $e');
  } finally {
    isLoading(false);
  }
}


  // Delete Kategori
  Future<void> deleteTag(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchTag();
        Get.snackbar('Success', 'Tag deleted successfully');
      } else {
        Get.snackbar('Error', 'Failed to delete Tag: ${response.reasonPhrase}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete Tag: $e');
    } finally {
      isLoading(false);
    }
  }
}
