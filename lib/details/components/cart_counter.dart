import 'package:ecommerce_task_app/details/details%20controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put(DetailsController());

    return Row(
      children: <Widget>[
        buildButton(
            icon: Icons.remove,
            press: () {if(controller.count>1)
              controller.decrement();
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          child: Obx(
            () => Text(
              '${controller.count.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        buildButton(
            icon: Icons.add,
            press: () {
              controller.increment();
            }),
      ],
    );
  }

  SizedBox buildButton({
    IconData? icon,
    Function()? press,
  }) {

    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
