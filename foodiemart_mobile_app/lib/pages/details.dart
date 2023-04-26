import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
//
import '../controllers/switch_controller.dart';
import '../controllers/cart_controller.dart';
import '../utils/constants.dart';
import '../controllers/food_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const MyFAB(),
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: const [
                TopImage(),
                HeaderWidget(),
                MiddleDescription(),
                DeliveryTime(),
                BottomPrice()
              ],
            ),
          ),
        ));
  }
}

/// Bottom Price Widget Components
class BottomPrice extends StatelessWidget {
  const BottomPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          width: w,
          height: h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rp${Get.find<FoodController>().salads[_controller.currentSaladIndex].price.toStringAsFixed(3)}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
  }
}

/// Delivery Time Widget Components
class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: w,
        height: h / 22,
        child: Row(
          children: [
            const Text(
              "Delivery Time",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              LineIcons.clock,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .deliveryTime,
              style:const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
  }
}

/// Middle Description Widget Components
class MiddleDescription extends StatelessWidget {
  const MiddleDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return Container(
        margin: const EdgeInsets.only(top: 30),
        width: w,
        height: h / 9,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .description,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            )),
      );
  }
}

/// My Custom FloatingActionButton
class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _foodController = Get.find<FoodController>();
    var _controller = Get.find<SwitchController>();
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.find<CartController>().add(
            id: _foodController.salads[_controller.currentSaladIndex].id,
            img: _foodController.salads[_controller.currentSaladIndex].img,
            title: _foodController.salads[_controller.currentSaladIndex].title,
            subtitle:
                _foodController.salads[_controller.currentSaladIndex].subtitle,
            price: _foodController.salads[_controller.currentSaladIndex].price,
          );
        },
        child: const Icon(
          LineIcons.shoppingCart,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

/// Header Widget Components - Blow Top Image
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();

    return SizedBox(
      width: double.infinity,
      height: h / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              child: Text(
                Get.find<FoodController>()
                    .salads[_controller.currentSaladIndex]
                    .title,
                style: TextStyle(
                  fontSize: Get.find<FoodController>()
                              .salads[_controller.currentSaladIndex]
                              .title
                              .length <=
                          13
                      ? 26
                      : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          
          SizedBox(
            width: w / 3,
            height: h / 18,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      Get.find<FoodController>()
                          .removeQ(_controller.currentSaladIndex);
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: GetBuilder<FoodController>(
                          id: "quantity",
                          builder: (context) {
                            return Text(
                              Get.find<FoodController>()
                                  .salads[_controller.currentSaladIndex]
                                  .quantity
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            );
                          })),
                
                CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () {
                        Get.find<FoodController>()
                            .addQ(_controller.currentSaladIndex);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Top Image Widget Components
class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    return SizedBox(
        width: w,
        height: h / 2.3,
        child: Hero(
            tag: Get.find<FoodController>()
                .salads[_controller.currentSaladIndex]
                .id,
            child: Image.asset(
              Get.find<FoodController>()
                  .salads[_controller.currentSaladIndex]
                  .img,
            )),
      );
  }
}

/// AppBar Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 30,
            ))
      ],
    );
  }
}
