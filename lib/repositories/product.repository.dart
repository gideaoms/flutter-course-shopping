import 'package:dio/dio.dart';
import 'package:shopping_v2/models/category-details.model.dart';
import 'package:shopping_v2/models/product-list-item.model.dart';
import 'package:shopping_v2/settings.dart';

class ProductRepository {
  Future<List<ProductListItemModel>> getAll() async {
    var url = '${Settings.apiUrl}/v1/products';
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((product) => ProductListItemModel.fromJson(product))
        .toList();
  }

  Future<List<ProductListItemModel>> getByCategory(String category) async {
    var url = '${Settings.apiUrl}/v1/categories/$category/products';
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((product) => ProductListItemModel.fromJson(product))
        .toList();
  }

  Future<ProductDetailsModel> getProduct(String tag) async {
    var url = '${Settings.apiUrl}/v1/products/$tag';
    Response response = await Dio().get(url);
    return ProductDetailsModel.fromJson(response.data);
  }
}
