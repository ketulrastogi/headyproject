class Rankings {
  final List<ProductViewed> productsViewed;
  final List<ProductShared> productsShared;
  final List<ProductOrdered> productsOrdered;

  Rankings({this.productsViewed, this.productsShared, this.productsOrdered});

  factory Rankings.fromMap(Map<String, dynamic> data) {
    return Rankings(
      productsViewed: (data[0] as List).map((productViewed) => null).toList(),
    );
  }
}

class ProductViewed {
  final int id;
  final int viewCount;

  ProductViewed({this.id, this.viewCount});

  factory ProductViewed.fromMap(Map<String, dynamic> data) {
    return ProductViewed(
      id: data['id'],
      viewCount: data['view_count'],
    );
  }
}

class ProductShared {
  final int id;
  final int shareCount;

  ProductShared({this.id, this.shareCount});

  factory ProductShared.fromMap(Map<String, dynamic> data) {
    return ProductShared(
      id: data['id'],
      shareCount: data['shares'],
    );
  }
}

class ProductOrdered {
  final int id;
  final int orderCount;

  ProductOrdered({this.id, this.orderCount});

  factory ProductOrdered.fromMap(Map<String, dynamic> data) {
    return ProductOrdered(
      id: data['id'],
      orderCount: data['order_count'],
    );
  }
}
