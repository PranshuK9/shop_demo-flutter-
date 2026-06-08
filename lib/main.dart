import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/cartProvider.dart';
import 'package:shop_demo/global_variables.dart';
import 'package:shop_demo/home_page.dart';
import 'package:shop_demo/product_card.dart';
import 'package:shop_demo/product_details.dart';

void main() {
  runApp(const MyApp());
}

//Provider : it is as read only value
//ChangeNotifierProvider : with this we can change the values and notify the widgets about that
//FutureProvider : it can listen to futures and subscribe to them to show the changes
//StreamProvider : providing a stream



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => Cartprovider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(254, 206, 1, 1),
          primary: Color.fromRGBO(254, 206, 1, 1)
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
          textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ) ,
      ),
          useMaterial3: true,
      ),
      title: 'Shopping App',
      // home: ProductDetails(
      //   product: products[0],
      // ),
      home: HomePage(),
    ),
    );
  }
}
