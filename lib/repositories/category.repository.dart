import 'package:dio/dio.dart';
import 'package:shopping_v2/models/category-list-item.model.dart';
import 'package:shopping_v2/settings.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = '${Settings.apiUrl}/v1/categories';
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((category) => CategoryListItemModel.fromJson(category))
        .toList();
  }
}
