import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/ui/view/mostordered/mostordered_viewmodel.dart';
import 'package:headyproject/ui/view/product/product_view.dart';
import 'package:stacked/stacked.dart';

class MostOrderedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MostOrderedViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'MOST ORDERED',
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.subtitle1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      // child: Text(
                      //   'View all',
                      //   style: GoogleFonts.nunito(
                      //     textStyle:
                      //         Theme.of(context).textTheme.subtitle1.copyWith(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //   ),
                      // ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'View All',
                            style: GoogleFonts.nunito(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200.0,
                child: ListView.builder(
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductView(
                        product: model.mostOrderedProducts[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => MostOrderedViewModel(),
    );
  }
}
