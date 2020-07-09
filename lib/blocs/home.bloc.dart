import 'package:flutter/widgets.dart';
import 'package:shopping_v2/models/category-list-item.model.dart';
import 'package:shopping_v2/models/product-list-item.model.dart';
import 'package:shopping_v2/repositories/category.repository.dart';
import 'package:shopping_v2/repositories/product.repository.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRepository = CategoryRepository();
  final productRepository = ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRepository.getAll().then((data) {
      categories = data;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((data) {
      products = data;
      notifyListeners();
    });
  }

  getProductsByCategory() {
    productRepository.getByCategory(selectedCategory).then((data) {
      products = data;
      notifyListeners();
    });
  }

  changeCategory(String tag) {
    selectedCategory = tag;
    products = null;
    getProductsByCategory();
  }
}
