import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/ui/view/categorylistwidget/categorylistwidget_viewmodel.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class CategoryListWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryListWidgetViewModel>.nonReactive(
      builder: (context, model, child) {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 8.0),
                // padding: EdgeInsets.symmetric(horizontal : 32.0),
                child: Text(
                  'CATEGORIES',
                  style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                height: 112.0,
                child: ListView.builder(
                  primary: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Hive.box('categories').length,
                  itemBuilder: (context, index) {
                    CategoryModel category =
                        Hive.box('categories').get(index) as CategoryModel;

                    if (category.name.length > 8) {
                      return Container();
                    }
                    return InkWell(
                      onTap: () {
                        print(category.name);
                        // model.navigateToProductListPage(category);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: (index < 0) ? 0.0 : 16.0,
                            right: 8.0,
                            top: 8.0,
                            bottom: 8.0),
                        margin: EdgeInsets.all(4.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 48.0,
                              width: 48.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 4.0,
                                    spreadRadius: 4.0,
                                  ),
                                ],
                              ),
                              child: Icon(Icons.album),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Container(
                              height: 24.0,
                              child: Text(
                                category.name,
                                style: GoogleFonts.nunito(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => CategoryListWidgetViewModel(),
    );
  }
}
