import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/ui/view/mostordered/mostordered_viewmodel.dart';
import 'package:headyproject/ui/view/mostshared/mostshared_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MostSharedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MostSharedViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
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
                    return Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
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
                      child: Center(
                        child: Text('Product'),
                      ),
                    );
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
