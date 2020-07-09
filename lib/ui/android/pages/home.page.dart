import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_v2/blocs/home.bloc.dart';
import 'package:shopping_v2/ui/shared/widgets/category/category-list.widget.dart';
import 'package:shopping_v2/ui/shared/widgets/product/product-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Categorias',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              CategoryListWidget(
                categories: bloc.categories,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Main Vendidos',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              ProductListWidget(
                products: bloc.products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
