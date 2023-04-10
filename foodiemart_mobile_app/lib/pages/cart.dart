import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
//
import '../controllers/food_controller.dart';
import '../controllers/navigator_controllers.dart';
import '../controllers/switch_controller.dart';
import '../controllers/cart_controller.dart';
import '../utils/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: mainDrawer(1),
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: MainItem(),
          ),
        ),
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  const MainItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cartController = Get.find<CartController>();
    var _controller = Get.find<SwitchController>();
    return Column(
      children: [
        GetBuilder<CartController>(builder: (context) {
          if (_cartController.cartFood.isEmpty) {
            return SizedBox(
              width: w,
              height: h,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                  "assets/images/not_found.png",
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "No Data To Show!",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ));
          } else {
            return Column(
              children: [
                SizedBox(
                    width: w,
                    height: h / 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: w / 3,
                          height: h / 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black),
                          child: Center(
                              child: Text(
                            "Total Item : ${_cartController.cartFood.length}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                        Container(
                          width: w / 1.8,
                          height: h / 24,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red),
                          child: Center(
                              child: Text(
                            "Total Price : Rp${_cartController.totalAmount().toStringAsFixed(3)}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        )
                      ],
                    )),
                SizedBox(
                  width: w,
                  height: h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cartController.cartFood.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: w,
                        height: h / 4.5,
                        child: Stack(children: [
                          Positioned(
                            top: 25,
                            right: 0,
                            child: FadeInLeft(
                              delay: Duration(
                                  milliseconds: (index / 0.5 * 100).toInt()),
                              child: Container(
                                width: w / 1.3,
                                height: h / 6,
                                decoration: BoxDecoration(
                                    color: unSelectedColor,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 221, 219, 219),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(-7, 11))
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 3,
                            child: FadeInLeft(
                              delay: Duration(
                                  milliseconds: (index / 0.5 * 200).toInt()),
                              child: SizedBox(
                                  width: w / 2.5,
                                  height: h / 5,
                                  child: Hero(
                                    tag: _cartController.cartFood[index].id,
                                    child: Image.asset(
                                      _cartController.cartFood[index].img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 40,
                            child: FadeInLeft(
                              delay: Duration(
                                  milliseconds: (index / 0.5 * 300).toInt()),
                              child: Text(
                                _cartController.cartFood[index].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 68,
                            child: FadeInLeft(
                              delay: Duration(
                                  milliseconds: (index / 0.5 * 400).toInt()),
                              child: Text(
                                "Rp${_cartController.cartFood[index].price.toStringAsFixed(3)}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 105,
                            child: FadeInLeft(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 500).toInt()),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: IconButton(
                                          onPressed: () {
                                            Get.find<FoodController>().removeQ(
                                                _controller.currentSaladIndex);
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                    width: 10.0,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                        child: GetBuilder<FoodController>(
                                            id: "quantity",
                                            builder: (context) {
                                              return Text(
                                                Get.find<FoodController>()
                                                    .salads[_controller
                                                        .currentSaladIndex]
                                                    .quantity
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              );
                                            })),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: IconButton(
                                          onPressed: () {
                                            Get.find<FoodController>().addQ(
                                                _controller.currentSaladIndex);
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Positioned(
                              bottom: 26,
                              right: 20,
                              child: FadeInRight(
                                delay: Duration(
                                    milliseconds: (index / 0.5 * 700).toInt()),
                                child: IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                            barrierDismissible: false,
                                            title: "Warning!",
                                            content: const Text(
                                              "Do you really wanna remove this Item from this list?",
                                              textAlign: TextAlign.center,
                                            ),
                                            confirmTextColor: Colors.white,
                                            onCancel: () {},
                                            onConfirm: () {
                                              _cartController
                                                  .removeSingleItem(index);
                                              Get.back();
                                            });
                                      },
                                      icon: const Icon(
                                        LineIcons.times,
                                        color: Colors.red,
                                      )),
                                
                              ))
                        ]),
                      );
                    },
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  minWidth: w,
                  height: h / 14,
                  child: const Text(
                    "Order Now",
                    style: TextStyle(fontSize: 18),
                  ),
                  color: unSelectedColor,
                ),
              ],
            );
          }
        }),
      ],
    );
  }
}

/// MyAppBar Widget Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    var _cartController = Get.find<CartController>();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        GetBuilder<CartController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: _cartController.cartFood.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          barrierDismissible: false,
                          title: "Warning!",
                          content: const Text(
                            "Do you really wanna remove all items from this list?",
                            textAlign: TextAlign.center,
                          ),
                          confirmTextColor: Colors.white,
                          onCancel: () {},
                          onConfirm: () {
                            _cartController.removeAllItems();
                            Get.back();
                          });
                    },
                    icon: const Icon(
                      LineIcons.trash,
                      color: Colors.red,
                      size: 35,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Get.find<NavigatorController>().changeNavBarIndex(0);
                    },
                    icon: const Icon(
                      LineIcons.plusCircle,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
