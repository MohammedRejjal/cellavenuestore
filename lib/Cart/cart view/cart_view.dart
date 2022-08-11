import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_task_app/Cart/cart%20controller/cart_controller.dart';
import 'package:ecommerce_task_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Cartview extends StatelessWidget {
  const Cartview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tran = Hive.box("transactions");
    CartController cartController = CartController();

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: tran.length,
                    itemBuilder: ((context, index) {
                      final prod = tran.get(index) as Transaction;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          tileColor: Colors.blue,
                          leading: CachedNetworkImage(
                            imageUrl: prod.images,
                            fit: BoxFit.contain,
                            width: 120,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          title: Text(prod.name),
                          subtitle: Row(
                            children: [
                              Text(prod.price),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Quantity " + prod.count.toString()),
                            ],
                          ),
                          // trailing: FutureBuilder(
                          //     future:
                          //         Future.delayed(const Duration(seconds: 2)),
                          //     builder: (context, snapshot) {
                          //       return IconButton(
                          //           onPressed: (() =>
                          //              removeProduct(tran, index)),
                          //           icon: Icon(Icons.delete));
                          //     }),
                        ),
                      );
                    }));
              } else {
                return const Center(
                  child: Text("No Data"),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

 Future<void> removeProduct(Box box, int index) async {
  await box.deleteAt(index);
}
