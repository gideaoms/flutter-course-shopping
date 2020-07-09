import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_v2/blocs/cart.bloc.dart';
import 'package:shopping_v2/blocs/home.bloc.dart';
import 'package:shopping_v2/blocs/theme.bloc.dart';
import 'package:shopping_v2/blocs/user.bloc.dart';
import 'package:shopping_v2/ui/android/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBlock>.value(
          value: CartBlock(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: AndroidApp(),
    );
  }
}
