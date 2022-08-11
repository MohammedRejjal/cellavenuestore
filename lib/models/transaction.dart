import 'package:ecommerce_task_app/models/Product.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String price;

  @HiveField(2)
  late String images;

  @HiveField(3)
  late int count;

  Transaction(
      {required this.count,
      required this.images,
      required this.name,
      required this.price});
}
