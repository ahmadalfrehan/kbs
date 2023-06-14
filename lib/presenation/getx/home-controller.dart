import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/response-model.dart';

class HomeController extends GetxController {
  RxString selected = 'select'.obs;

  RxList<ResultModel> result1 = <ResultModel>[].obs;
  RxList<ResultModel> result2 = <ResultModel>[].obs;
  RxList<ResultModel> result3 = <ResultModel>[].obs;
  RxList<List<String>> option = [
    [
      'vegetarian',
      'vegan',
    ],
    [
      'weight loss',
      'muscle gain',
    ],
    [
      'spicy',
      'sweet',
    ],
  ].obs;
  RxList messages = <String>[
    'Enter your dietary requirement (vegetarian, vegan): ',
    'Enter your health goal (weight loss, muscle gain):',
    'Enter your personal preference (spicy, sweet): ',
  ].obs;
  RxList apiType = [
    'types/',
    'weight-muscle/',
    'spicy-sweet/',
  ].obs;
  RxBool isLoading = false.obs;

  getData(String apiType) async {
    isLoading.value = true;
    print('http://127.0.0.1:8000/$apiType');
    try {
      final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/$apiType'),
          body: json.encode({'input': selected.value}));
      log(response.body.toString());
      final data = json.decode(response.body);
      result1.clear();
      result2.clear();
      result3.clear();
      Map<String, dynamic> userData = Map<String, dynamic>.from(data);
      for (var o in userData['message']) {
        if (apiType == 'types/') {
          result1.value.add(ResultModel.fromJson(o));
        } else if (apiType == 'spicy-sweet/') {
          result2.value.add(ResultModel.fromJson(o));
        } else if (apiType == 'weight-muscle/') {
          result3.value.add(ResultModel.fromJson(o));
        }
      }
    } catch (error) {
      log(error.toString());
    }
    isLoading.value = false;
  }
}
