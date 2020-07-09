import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_v2/models/authenticate.-user.model.dart';
import 'package:shopping_v2/models/create-user.model.dart';
import 'package:shopping_v2/models/user.model.dart';
import 'package:shopping_v2/repositories/account.repository.dart';
import 'package:shopping_v2/settings.dart';

class UserBloc extends ChangeNotifier {
  var user = UserModel();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(AuthenticateUserModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = AccountRepository();

      var response = await repository.authenticate(model);

      user = response;
      await prefs.setString('user', jsonEncode(response));

      return response;
    } catch (err) {
      user = null;
      return null;
    }
  }

  Future<UserModel> create(CreateUserModel model) async {
    try {
      var repository = AccountRepository();
      var response = await repository.create(model);

      return response;
    } catch (err) {
      print(err);
      user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var response = UserModel.fromJson(jsonDecode(userData));
      Settings.user = response;
      user = response;
    }
  }
}
