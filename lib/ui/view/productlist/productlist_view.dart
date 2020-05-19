import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/ui/view/productlist/productlist_viewmodel.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class ProductListView extends StatelessWidget {
  final CategoryModel category;

  const ProductListView({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(category.name);
    return ViewModelBuilder<ProductListViewModel>.reactive(
      onModelReady: (model) => model.getProductListForCategory(category),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('SubCategoryList'),
            ),
            body: ListView.builder(
              itemCount: model.products.length,
              itemBuilder: (context, index) {
                // ProductModel product = Hive.box('products').get(index) as ProductModel;
                return ListTile(title: Text('Hello'));
              },
            ),
          ),
        );
      },
      viewModelBuilder: () => ProductListViewModel(),
    );
  }
}
