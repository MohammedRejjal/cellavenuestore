import 'package:ecommerce_task_app/Utils/constants.dart';
import 'package:ecommerce_task_app/models/Product.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class WooCommerceApi {
  
  Future<List<Product>?> getProducts(int pageNum, bool onSale) async {
    List<Product>? _product = [];
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "${Constants.baseURL}",
        consumerKey: "${Constants.consumerKey}",
        consumerSecret: "${Constants.consumerSecret}");
    if (onSale == true) {
      var json =
          await wooCommerceAPI.getAsync("products?page=$pageNum&per_page=20");
      _product = productFromJson(json);
    } else {
      var json = await wooCommerceAPI
          .getAsync("products?page=$pageNum&per_page=20&on_sale=true");
      _product = productFromJson(json);
    }

    return _product;
  }
}
