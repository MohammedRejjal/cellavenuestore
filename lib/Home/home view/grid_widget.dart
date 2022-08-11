import 'package:ecommerce_task_app/details/detail%20view/details_screen.dart';
import 'package:ecommerce_task_app/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget listItems(int count, List<Product> data, bool onSale) {
  print(count);
  return GridView.builder(
      itemCount: count,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(DetailsScreen(product: data[index]));
          },
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage("${data[index].images[0].src}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "${data[index].attributes[2].options[0]} ",
                  )),
            ),
            if (onSale)
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 60),
                child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Text(
                        "${(((double.parse(data[index].regularPrice) - double.parse(data[index].price)) / double.parse(data[index].regularPrice)) * 100).toStringAsFixed(0)}% ",
                        style: TextStyle(color: Colors.red))),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black26,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "${data[index].name}",
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onSale
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${data[index].regularPrice}.00د.ك",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black45,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  "${data[index].price}.00د.ك",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              "${data[index].salePrice}.00د.ك",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        );
      });
}
