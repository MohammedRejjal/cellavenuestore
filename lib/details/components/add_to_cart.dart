import 'package:ecommerce_task_app/Cart/cart%20view/cart_view.dart';
import 'package:ecommerce_task_app/boxes.dart';
import 'package:ecommerce_task_app/details/details%20controller/details_controller.dart';
import 'package:ecommerce_task_app/models/Product.dart' as pro;
import 'package:ecommerce_task_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    @required this.product,
  }) : super(key: key);

  final pro.Product? product;

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put(DetailsController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(),
            ),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Get.to(Cartview());
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final tran = Hive.box("transactions");
                  if (tran.containsKey(tran.keys)) {
                    Get.snackbar(
                        "The product is already in your basket", "Sorry");
                  } else {
                    Transaction transaction = Transaction(
                        count: controller.count.value,
                        images: "${product!.images[0].src}",
                        name: "${product!.name}",
                        price: "${product!.price}");
                    tran.add(transaction);
                    print(tran.length);
                    Get.snackbar(
                        "The product has been added to your basket", "Thanks");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    "add to cart".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
