import 'package:flutter/material.dart';
import 'package:headyproject/ui/view/categorylist/categorylist_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryListViewModel>.nonReactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('CategoryList'),
            ),
            body: Center(
              child: Text('Category List View'),
            ),
          ),
        );
      },
      viewModelBuilder: () => CategoryListViewModel(),
    );
  }
}
