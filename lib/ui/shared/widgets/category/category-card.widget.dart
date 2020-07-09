import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_v2/blocs/home.bloc.dart';
import 'package:shopping_v2/models/category-list-item.model.dart';
import 'package:shopping_v2/settings.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryListItemModel category;

  CategoryCardWidget({
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: category.tag == bloc.selectedCategory
            ? Settings.primaryColor.withOpacity(.3)
            : Settings.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: FlatButton(
        child: Image.asset(
            'assets/categories/${Settings.theme}/${category.tag}.png'),
        onPressed: () {
          bloc.changeCategory(category.tag);
        },
      ),
    );
  }
}
