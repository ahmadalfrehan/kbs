import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/response-model.dart';

class HomeController extends GetxController {
  RxString selected1 = 'select'.obs;
  RxString selected2 = 'select'.obs;
  RxString selected3 = 'select'.obs;

  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController competing = TextEditingController();
  RxBool competingBool = false.obs;
  RxBool genderBool = false.obs;
  RxString intensity = "select".obs;

  RxList<ResultModel> result1 = <ResultModel>[].obs;
  Rx<ResultModel> result = ResultModel.empty().obs;
  RxList<ResultModel> result2 = <ResultModel>[].obs;
  RxList<ResultModel> result3 = <ResultModel>[].obs;
  RxList<String> optionIntensity = <String>["low", "moderate", "high"].obs;
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

  performPostRequest(int index, String apiType, String selected) async {
    isLoading.value = true;
    print('http://127.0.0.1:8000/$apiType');
    log(json.encode({
      "age": age.text,
      "height": height.text,
      "weight": weight.text,
      "gender": gender.text,
      "competing": competing.text,
      "intensity": intensity.value
    }));
    try {
      final response =
          await http.post(Uri.parse('http://127.0.0.1:8000/$apiType'),
              headers: {"Content-Type": "application/json"},
              body: json.encode({
                "age": age.text,
                "height": height.text,
                "weight": weight.text,
                "gender": gender.text,
                "competing": competing.text,
                "intensity": intensity.value
              }));
      log(response.body.toString());
      log(response.statusCode.toString());
      final data = json.decode(response.body);
      if (index == 0) {
        result1.clear();
      }
      if (index == 1) {
        result2.clear();
      }
      if (index == 2) {
        result3.clear();
      }
      Map<String, dynamic> userData = Map<String, dynamic>.from(data['result']);
      log(userData.toString());

      // result1.value.add(ResultModel.fromJson(o['result']));
      result.value = ResultModel.fromJson(userData['result']);
      log(result.toString());
    } catch (error) {
      log(error.toString());
    }
    isLoading.value = false;
  }
}
