import 'package:ecommerce_task_app/Cart/cart%20view/cart_view.dart';
import 'package:ecommerce_task_app/Home/home%20view/grid_widget.dart';
import 'package:ecommerce_task_app/Utils/size_config.dart';
import 'package:ecommerce_task_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_task_app/Service/WooCommerceApi.dart' as a;
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int page = 2;
    SizeConfig(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon:const Icon(Icons.shopping_cart),
              onPressed: () {
                
                Get.to(Cartview());
              },
            ),
           const SizedBox(width: 20 / 2)
          ],
          title: const Text("E-commerce app"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
               Container(
                    color:const Color.fromARGB(255, 105, 130, 142),
                    width: double.infinity,
                    height: getScreenHeight()/15,
                    child: Text("Recently products" , textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: getScreenHeight()/25),),
                  ),
              FutureBuilder<List<Product>?>(
                  future: a.WooCommerceApi().getProducts(page, false),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data != null) {
                        return SizedBox(
                            height: getScreenHeight() / 2.5,
                            child: listItems(
                                snapshot.data!.length, snapshot.data!, false));
                      } else {
                        return const Center(child: Text("no data"));
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                  Container(
                    color: Color.fromARGB(255, 105, 130, 142),
                    width: double.infinity,
                    height: getScreenHeight()/15,
                    child: Text("Sale products" , textAlign: TextAlign.center, style: TextStyle(color: Colors.white,fontSize: getScreenHeight()/25),),
                  ),
              FutureBuilder(
                future: a.WooCommerceApi().getProducts(3, true),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List list = snapshot.data;
            
                    return SizedBox(
                        height: getScreenHeight() / 2.5,
                        child: listItems(list.length, snapshot.data, true));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
