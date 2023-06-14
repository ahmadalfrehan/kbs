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

                            i == 0
                                ? controller.selected1.value = value.toString()
                                : i == 2
                                    ? controller.selected2.value =
                                        value.toString()
                                    : controller.selected3.value =
                                        value.toString();
                            controller.getData(i,
                              controller.apiType[i],
                              i == 0
                                  ? controller.selected1.value
                                  : i == 2
                                      ? controller.selected2.value
                                      : controller.selected3.value,
                            );
                          },
                          message: controller.messages[i],
                          options: controller.option[i],
                          results: i == 0
                              ? controller.result1
                              : i == 1
                                  ? controller.result2
                                  : controller.result3,
                          selected: i == 0
                              ? controller.selected1.value
                              : i == 2
                                  ? controller.selected2.value
                                  : controller.selected3.value,
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
