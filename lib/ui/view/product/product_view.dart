import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/models/variant_model.dart';
import 'package:headyproject/ui/view/product/product_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;

  const ProductView({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      onModelReady: (model) => model.setProduct(product),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.card_giftcard,
                        size: 64.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // model.setVarient();
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) {
                              return Container(
                                child: Wrap(
                                    children: model.variants
                                        .map((variant) => RadioListTile(
                                              title: Text(
                                                  'Color: ${variant.color},  Price: ${variant.price}, ${(variant.size != null) ? '  Size:' + variant.size.toString() : ''}'),
                                              groupValue: model.variant,
                                              onChanged: (VariantModel value) {
                                                model.setVarient(value);
                                                Navigator.pop(context);
                                              },
                                              value: variant,
                                            ))
                                        .toList()),
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 4.0,
                                spreadRadius: 4.0,
                              ),
                            ]),
                        child: Icon(
                          Icons.style,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Price: ',
                            style: GoogleFonts.nunito(
                              textStyle:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Text(
                            model.variant.price.toString(),
                            style: GoogleFonts.nunito(
                              textStyle:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black87,
                                        // fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    (model.variant.size != null)
                        ? Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Size: ',
                                  style: GoogleFonts.nunito(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Text(
                                  model.variant.size.toString(),
                                  style: GoogleFonts.nunito(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.black87,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Color: ',
                            style: GoogleFonts.nunito(
                              textStyle:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Text(
                            model.variant.color,
                            style: GoogleFonts.nunito(
                              textStyle:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.black87,
                                        // fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

  // ShowModelDialog

  void selectVarient(context) {}
}
