import 'package:ecommerce_task_app/models/Product.dart';
import 'package:flutter/material.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key ?key,
    required this.product,
    
  }) : super(key: key);
  final Product?  product;
 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CartCounter(),
          ],
        ),
      ),
    );
  }
}
