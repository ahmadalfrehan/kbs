import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs/presenation/getx/home-controller.dart';
import 'package:kbs/presenation/home/options-results.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Food assistant app'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < 3; ++i)
                        OptionsResults(
                          onPressed: (value) {
                            print(value);
                            controller.selected.value =value.toString();
                            controller.getData(controller.apiType[i]);

                          },
                          message: controller.messages[i],
                          options: controller.option[i],
                          results: i == 0
                              ? controller.result1
                              : i == 1
                                  ? controller.result2
                                  : controller.result3,
                          selected: controller.selected.value,
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
