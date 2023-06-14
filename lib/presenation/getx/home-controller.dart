import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/response-model.dart';

class HomeController extends GetxController {
  RxString selected = 'select'.obs;
  RxList<ResultModel> result = <ResultModel>[].obs;
  RxBool isLoading  =  false.obs;
  getData() async {
    isLoading.value = true;
    try {
      final response = await http.post(
          Uri.parse('http://127.0.0.1:8000/types/'),
          body: json.encode({'input': selected.value}));
      log(response.body.toString());
      final data = json.decode(response.body);
      result.clear();
      Map<String, dynamic> userData = Map<String, dynamic>.from(data);
      for (var o in userData['message']) {
        result.value.add(ResultModel.fromJson(o));
      }
    } catch (error) {
      log(error.toString());
    }
    isLoading.value = false;
  }
}
