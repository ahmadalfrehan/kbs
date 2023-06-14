import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs/presenation/getx/home-controller.dart';

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
                      const Text(
                          'Enter your dietary requirement (vegetarian, vegan): '),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(controller.selected.value),
                          items: <String>['vegetarian', 'vegan']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.selected.value = value.toString();
                            controller.getData();
                          },
                        ),
                      ),
                      const Text('Results:'),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                            itemCount: controller.result.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  controller.result[index].result.toString());
                            }),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
