import 'package:ecommerce_task_app/Utils/size_config.dart';
import 'package:ecommerce_task_app/models/Product.dart' as pro;
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    @required this.product,
  }) : super(key: key);

  final pro.Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                    SizedBox(height: 20),

          Text(
            product!.name,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height:30),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product!.price}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
              
              child: Image.network(width: getScreenWidth()/2,height: getScreenHeight()/4,
              
      product!.images[0].src,
                fit: BoxFit.fitHeight,
  ),
  
              
              )
            ],
          )
        ],
      ),
    );
  }
}
