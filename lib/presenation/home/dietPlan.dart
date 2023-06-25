import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs/model/response-model.dart';
import 'package:kbs/presenation/getx/home-controller.dart';

class DietPlan extends GetView<HomeController> {
  const DietPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(37, 45, 52, 1),
          title: const Text("Diet System"),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: Get.width / 1.09,
                        height: 200,
                        clipBehavior: Clip.none,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/diet.png"),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: SingleChildScrollView(
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
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        controller: controller.height,
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
                                        controller: controller.weight,
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
                                              groupValue:
                                                  !controller.genderBool.value,
                                              onChanged: (v) {
                                                controller.genderBool.value =
                                                    !v!;
                                                controller.gender.text =
                                                    "female";
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
                                              groupValue:
                                                  controller.genderBool.value,
                                              onChanged: (v) {
                                                controller.genderBool.value =
                                                    v!;
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
                                              value: controller
                                                  .competingBool.value,
                                              onChanged: (value) {
                                                controller.competingBool.value =
                                                    value;
                                                controller.competing.text =
                                                    value == true ? "y" : "n";
                                              })
                                        ],
                                      ),
                                      const Text(
                                          "How intense are your training?"),
                                      Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            hint: Text(controller.intensity
                                                .toString()),
                                            items: controller.optionIntensity
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (v) {
                                              controller.intensity.value =
                                                  v.toString();
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      InkWell(
                                        onTap: () {
                                          controller.performPostRequest(
                                              0, "advanced-diet", "selected");
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Obx(
                                                  () => AlertDialog(
                                                    insetPadding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    content: _alert(controller
                                                        .result.value),
                                                  ),
                                                );
                                              });
                                        },
                                        onLongPress: () {
                                          controller.performPostRequest(
                                              0, "diet", "selected");
                                        },
                                        child: Container(
                                          height: 45,
                                          width: Get.width / 1.2,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                37, 45, 52, 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Text(
                                            "Save",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  _alert(ResultModel resultModel) {
    return Container(
      decoration: const BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width / 2.5,
                  height: 150,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/check.png"),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Here is your plan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Since your gender is : ${resultModel.yourGender}'),
            const SizedBox(height: 10),
            Text("and your age is:${resultModel.yourAge}"),
            const SizedBox(height: 10),
            Text(
                "We have calculated your calories based using Mifflin St Jeor Equation And your calorie_goal:${resultModel.caloriesGoal}"),
            const SizedBox(height: 10),
            Text("BMI Value: ${resultModel.bmi?.value}"),
            Text("BMI category: ${resultModel.bmi?.category}"),
            const SizedBox(height: 10),
            Text("Considering you need : ${resultModel.neededCalories}"),
            const SizedBox(height: 10),
            const Text(
              "Here is the Recommended Food For you :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 10),
            Text(
              resultModel.recommendedFoods.toString(),
            ),
            const SizedBox(height: 10),
            Text(
                "You are recommended eat these in set : ${resultModel.setRecommended}"),
            const SizedBox(height: 10),
            Text(
                "All foods in this set contains calories in the ${resultModel.rangeCalories}"),
            const SizedBox(height: 10),
            const Text(
              "Explanation : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text("${resultModel.explanation}"),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 45,
                width: Get.width / 1.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 45, 52, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
