import 'package:dio/dio.dart';
import 'package:flutter_challenge/modules/controller/home_controller.dart';
import 'package:flutter_challenge/modules/repositories/repository.dart';
import 'package:get/get.dart';

class DataBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(Get.find()));
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => Repository(Get.find()));
  }
}
