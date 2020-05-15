import 'package:flutter/material.dart';
import 'package:headyproject/ui/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(model.title),
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
