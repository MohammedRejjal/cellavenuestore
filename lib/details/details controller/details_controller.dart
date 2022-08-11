import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DetailsController extends GetxController {
  var aaa = Hive.box("transactions").obs  ;
  var count = 1.obs;
  increment() => count++;
  decrement() => count--;
 
}
