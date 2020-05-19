import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/ui/view/categorylist/categorylist_view.dart';
import 'package:headyproject/ui/view/categorylistwidget/categorylistwidget_view.dart';
import 'package:headyproject/ui/view/home/home_viewmodel.dart';
import 'package:headyproject/ui/view/mostordered/mostordered_view.dart';
import 'package:headyproject/ui/view/mostshared/mostshared_view.dart';
import 'package:headyproject/ui/view/mostviewed/mostviewed_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Heady Shop',
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              // shape: Border(
              //   bottom: BorderSide(
              //     color: Theme.of(context).primaryColor,
              //   ),
              // ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            // backgroundColor: Colors.white,
            body: ListView(
              // padding: EdgeInsets.all(16.0),
              children: <Widget>[
                CategoryListWidgetView(),
                Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                MostOrderedView(),
                Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                MostViewedView(),
                Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                ),
                MostSharedView(),
              ],
            ),
            // body: ListView.builder(
            //   itemCount: model.categories.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(model.categories[index].name),
            //     );
            //   },
            // ),
            // body: Center(
            //   child: Text(model.categories.length.toString()),
            // ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

// class TopCategoryWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GridView.builder(
//         itemCount: 8,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//         itemBuilder: (context, index) {
//           return Container(
//             child: Text(model.categories[index]['name']),
//           );
//         },
//       ),
//     );
//   }
// }
