import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping_v2/blocs/cart.bloc.dart';
import 'package:shopping_v2/models/cart-item.model.dart';
import 'package:shopping_v2/ui/shared/widgets/cart/cart-item.widget.dart';
import 'package:shopping_v2/ui/shared/widgets/shared/loader.widget.dart';

class CartPage extends StatelessWidget {
  CartBlock bloc;
  final price = NumberFormat('#,##0.00', 'pt_BR');
  var items = List<CartItemModel>();

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBlock>(context);
    items = bloc.cart;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Loader(
                object: bloc.cart,
                callback: list,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ ${price.format(bloc.total)}',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  FlatButton(
                    child: Text('Checkout'),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(.1),
          ),
        );
      },
    );
  }
}
