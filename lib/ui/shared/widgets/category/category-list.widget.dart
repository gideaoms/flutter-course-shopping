import 'package:flutter/widgets.dart';
import 'package:shopping_v2/models/category-list-item.model.dart';
import 'package:shopping_v2/ui/shared/widgets/category/category-card.widget.dart';
import 'package:shopping_v2/ui/shared/widgets/shared/loader.widget.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  CategoryListWidget({
    @required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel category = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCardWidget(
            category: category,
          ),
        );
      },
    );
  }
}
