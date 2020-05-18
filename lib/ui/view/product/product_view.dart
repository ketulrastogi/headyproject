import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/ui/view/product/product_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;

  const ProductView({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
          width: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 4.0,
                spreadRadius: 4.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.card_giftcard,
                        size: 80.0,
                      ),
                    ),
                    Container(
                      color: Colors.cyanAccent,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Text(
                      product.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunito(
                        textStyle:
                            Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Text(product.categoryId.toString()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ProductViewModel(),
    );
  }
}
