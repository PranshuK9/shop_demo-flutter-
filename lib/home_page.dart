import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_demo/cartPage.dart';
import 'package:shop_demo/global_variables.dart';
import 'package:shop_demo/productList.dart';
import 'package:shop_demo/product_card.dart';
import 'package:shop_demo/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   int currPage = 0;

   List<Widget> pages = const [Productlist(),Cartpage()];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: currPage == 0,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && currPage != 0) {
            setState(() {
              currPage = 0;
            });
          }
        },
      child: Scaffold(
      body: IndexedStack(
       index: currPage,
       children: pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0 ,
        onTap: (value){
          setState(() {
            currPage = value;
          });
        },
        currentIndex: currPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            )
          ],
      ),
      ),
    );
  }
}
