import 'package:ecommerce_task_app/Cart/cart%20controller/cart_controller.dart';
import 'package:ecommerce_task_app/Home/home%20controller/home_controller.dart';
import 'package:get/get.dart';

class CartBinding with Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
