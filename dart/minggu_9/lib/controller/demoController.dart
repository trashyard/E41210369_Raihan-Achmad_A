import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '/model/product.dart';
import 'package:get/get.dart';

class DemoController extends GetxController {
  var cartItems = <Product>[].obs;

  int get cartCount => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0.0, (sum, element) => sum + element.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  resetCart() => cartItems.clear();

  final storage = GetStorage();

  bool get isDark => storage.read('darkmode') ?? false;

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();

  void changeTheme(bool val) => storage.write('darkmode', val);
}

