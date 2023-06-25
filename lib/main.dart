import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs/presenation/getx/home-bindings.dart';
import 'package:kbs/presenation/home/dietPlan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DietPlan(),
      color: Color.fromRGBO(37, 45, 52, 1),
      // theme: ThemeData(
      //   primarySwatch:
      // ),
      initialBinding: HomeBindings(),
    );
  }
}
