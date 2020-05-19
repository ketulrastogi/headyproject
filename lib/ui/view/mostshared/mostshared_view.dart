import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/ui/view/mostordered/mostordered_viewmodel.dart';
import 'package:headyproject/ui/view/mostshared/mostshared_viewmodel.dart';
import 'package:headyproject/ui/view/product/product_view.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class MostSharedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MostSharedViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 8.0),
                child: Text(
                  'MOST SHARED',
                  style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                height: 200.0,
                child: ListView.builder(
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Hive.box('mostShared').length,
                  itemBuilder: (context, index) {
                    ProductModel product =
                        Hive.box('mostShared').get(index) as ProductModel;
                    return ProductView(product: product);
                  },
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => MostSharedViewModel(),
    );
  }
}
