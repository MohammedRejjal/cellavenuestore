import 'package:ecommerce_task_app/Utils/size_config.dart';
import 'package:ecommerce_task_app/details/components/counter.dart';
import 'package:ecommerce_task_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'add_to_cart.dart';
import 'description.dart';
import 'product_with_image.dart';

class Body extends StatelessWidget {
  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: getScreenHeight(),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: getScreenHeight() / 6),
                  padding: EdgeInsets.only(
                    top: getScreenHeight() * 0.1,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: getScreenHeight() / 10),
                      Description(product: product),
                      SizedBox(height: 10),
                      CounterWithFavBtn(product: product),
                      SizedBox(height: 10),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
