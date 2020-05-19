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
                        model.setVarient();
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
                          color: Theme.of(context).primaryColor,
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
                            model.varient.price.toString(),
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
                    (model.varient.size != null)
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
                                  model.varient.size.toString(),
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
                            'Golden',
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
}
