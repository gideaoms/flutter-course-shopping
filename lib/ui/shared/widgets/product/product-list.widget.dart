import 'package:flutter/material.dart';
import 'package:shopping_v2/models/product-list-item.model.dart';
import 'package:shopping_v2/ui/shared/widgets/product/product-card.widget.dart';
import 'package:shopping_v2/ui/shared/widgets/shared/loader.widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductListItemModel> products;

  ProductListWidget({
    @required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Loader(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        ProductListItemModel product = products[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCardWidget(
            product: product,
          ),
        );
      },
    );
  }
}
