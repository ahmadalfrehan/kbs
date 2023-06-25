import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs/presenation/getx/home-controller.dart';

class DietPlan extends GetView<HomeController> {
  const DietPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                )
              : SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height / 1.2,
                        width: Get.width / 1.09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.21),
                              blurRadius: 17,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Enter your age "),
                              const SizedBox(height: 5),
                              TextField(
                                controller: controller.age,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your age",
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Enter your height"),
                              const SizedBox(height: 5),
                              TextField(
                                controller: controller.age,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Height",
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Enter your weight"),
                              const SizedBox(height: 5),
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: controller.age,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Weight",
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Enter your gender"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Female"),
                                  Radio(
                                      value: true,
                                      groupValue: !controller.genderBool.value,
                                      onChanged: (v) {
                                        controller.genderBool.value = !v!;
                                        controller.gender.text = "female";
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Male"),
                                  Radio(
                                      value: true,
                                      groupValue: controller.genderBool.value,
                                      onChanged: (v) {
                                        controller.genderBool.value = v!;
                                        controller.gender.text = "male";
                                      }),
                                ],
                              ),
                              const Text(
                                  "Are you participating in a competition?"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("yes or no"),
                                  Switch.adaptive(
                                      value: controller.competingBool.value,
                                      onChanged: (value) {
                                        controller.competingBool.value = value;
                                        controller.competing.text =
                                            value == true ? "yes" : "no";
                                      })
                                ],
                              ),
                              const Text("How intense are your training?"),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Text(controller.intensity.toString()),
                                    items: controller.optionIntensity
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      controller.intensity.value = v.toString();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: (){
                                  controller.performPostRequest(0, "advanced-diet", "selected");
                                },
                                onLongPress: (){
                                  controller.performPostRequest(0, "diet", "selected");
                                },
                                child: Container(
                                  height: 45,
                                  width: Get.width / 1.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("Save",style: TextStyle(color: Colors.white),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
