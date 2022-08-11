List<Product> productFromJson(List<dynamic> str) {
  List<Product> products = [];
  for (var element in str) {
    products.add(Product.fromJson(element));
  }
  return products;
}


class Product {
    Product({
      required  this.attributes,
      required  this.name,
      required  this.id,
      required  this.regularPrice,
      required  this.price,
      required  this.description,
      required  this.salePrice,
       required this.images,
    });

    List<Attribute> attributes;
    String name;
    int id;
    String regularPrice;
    String price;
    String description;
    String salePrice;
    List<Image> images;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
        name: json["name"],
        id: json["id"],
        regularPrice: json["regular_price"],
        price: json["price"],
        description: json["description"],
        salePrice: json["sale_price"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "name": name,
        "id": id,
        "regular_price": regularPrice,
        "price": price,
        "description": description,
        "sale_price": salePrice,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class Attribute {
    Attribute({

      required  this.options,
    });

   
    List<String> options;

    factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    
        options: List<String>.from(json["options"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
      
        "options": List<dynamic>.from(options.map((x) => x)),
    };
}

class Image {
    Image({
      required  this.src,
    });

    String src;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
    );

    Map<String, dynamic> toJson() => {
        "src": src,
    };
}
