import 'package:ecommerce_task_app/Home/home%20controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding with Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
