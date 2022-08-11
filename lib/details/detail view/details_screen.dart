import 'package:ecommerce_task_app/Cart/cart%20view/cart_view.dart';
import 'package:ecommerce_task_app/details/components/body.dart';
import 'package:ecommerce_task_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(child: Body(product: product)),
    );
  }

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
          Get .to(Cartview());
          },
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }
}
