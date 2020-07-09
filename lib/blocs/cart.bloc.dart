import 'package:flutter/widgets.dart';
import 'package:shopping_v2/models/cart-item.model.dart';

class CartBlock extends ChangeNotifier {
  var cart = List<CartItemModel>();
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  itemInCart(CartItemModel item) {
    var result = false;
    cart.forEach((element) {
      if (element.id == item.id) result = true;
    });
    return result;
  }

  calculateTotal() {
    total = 0;
    cart.forEach((item) {
      total += item.price * item.quantity;
    });
    notifyListeners();
  }
}
