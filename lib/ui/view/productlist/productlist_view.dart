import 'package:flutter/material.dart';
import 'package:headyproject/ui/view/productlist/productlist_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.nonReactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('SubCategoryList'),
            ),
            body: Center(
              child: Text('Sub Category List View'),
            ),
          ),
        );
      },
      viewModelBuilder: () => ProductListViewModel(),
    );
  }
}
