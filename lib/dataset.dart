import 'dart:developer';

import 'package:flutter/foundation.dart';

class Dataclass {
  List categorybehind = [];
  List categoryList = [];
  searchCategories(String query, type) {
    // setState(() async {
    if (query.isNotEmpty) {
      categorybehind = [];
      print("search query2 ${categoryList!.length}");
      categoryList!.forEach((item) {
        if (item.jobName!.toLowerCase().contains(query.toLowerCase())) {
          // setState(() {
          log(item.jobName.toString());
          categorybehind!.add(item);
        }
        // notifyListeners();
      });
    } else {
      categorybehind = categoryList;
      // notifyListeners();
    }
    // });
  }

  sortlist() {
    List<Map<String, dynamic>> myProducts = [
      {"name": "Shoes", "price": 100},
      {"name": "Pants", "price": 50},
      {"name": "Book", "price": 10},
      {"name": "Lamp", "price": 40},
      {"name": "Fan", "price": 200}
    ];

    // Selling price from low to high
    myProducts.sort((a, b) => a["price"].compareTo(b["price"]));

    // Selling price from high to low
    // myProducts.sort((a, b) => b["price"].compareTo(a["price"]));

    if (kDebugMode) {
      print('Low to hight in price: $myProducts');
      print('High to low in price: $myProducts');
    }
  }
}
