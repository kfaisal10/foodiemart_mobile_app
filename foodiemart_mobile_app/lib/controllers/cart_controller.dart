import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import '../model/salads_model.dart';

class CartController extends GetxController {
  List<SaladModel> cartFood = [];

  // Method for adding item into cartFood List
  void add({
    required id,
    required img,
    required title,
    required subtitle,
    required price,
  }) {
    var contain = cartFood.where((element) => element.id == id);
    if (contain.isEmpty) {
      cartFood.add(SaladModel(
          id: id,
          img: img,
          title: title,
          subtitle: subtitle,
          deliveryTime: "",
          price: price,
          description: "",
          quantity: 0));
      Get.snackbar("Notice!", "Added To Your Cart",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
      update();
    } else {
      Get.snackbar("Warning!", "You have Added this Item before",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
    }
  }

  // Method for removing all items from the CartFood List
  void removeAllItems() {
    cartFood = [];
    update();
  }

  // Method for removing single item from CartFood List
  void removeSingleItem(int index) {
    cartFood.removeAt(index);
    update();
  }

  // Method For Calculating Total Price of foods
  double totalAmount() {
    var sumPrice = 0.0;
    for (SaladModel cartFood in cartFood) {
      sumPrice = sumPrice + cartFood.price; 
    }
    return sumPrice;
    
  }
  
}
