// ignore_for_file: must_be_immutable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_mobile_app_ui/controllers/discount_controller.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

///
import '../pages/setting.dart';
import '../controllers/navigator_controllers.dart';
import '../controllers/cart_controller.dart';
import '../utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: mainDrawer(0),
        appBar: const UserProfileAppBar(),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const TopUserInfo(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: w,
                height: h / 1.6,
                child: Stack(children: [
                  const OrangeSection(),
                  BottomSection(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Bottom Section Widget Components
class BottomSection extends StatelessWidget {
  BottomSection({
    Key? key,
  }) : super(key: key);

  List<String> performances = [
    "Orders History",
    "Payment",
    "Tracking",
    "Statistics",
    "Settings",
    "Log Out"
  ];

  List<String> imagePath = [
    'assets/images/his.png',
    'assets/images/pay.png',
    'assets/images/tr.png',
    'assets/images/stas.png',
    'assets/images/set.png',
    'assets/images/log.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: FadeInUp(
        delay: const Duration(milliseconds: 600),
        child: Container(
          width: w,
          height: h / 2.2,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: GridView.builder(
              itemCount: 6,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.99,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    index == 4
                        ? Get.to(const SettingPage(),
                            transition: Transition.cupertino)
                        : Container();
                  },
                  child: FadeInUp(
                    delay: Duration(milliseconds: 600 * index ~/ 1.5),
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: unSelectedColor, width: 1.5)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              delay: Duration(milliseconds: 650 * index ~/ 1.5),
                              child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(imagePath[index])),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            FadeInUp(
                              delay: Duration(
                                milliseconds: 700 * index ~/ 1.5,
                              ),
                              child: Text(performances[index],
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 117, 117, 117),
                                      fontSize: 16)),
                            )
                          ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

///Purple Section Widget Components
class OrangeSection extends StatelessWidget {
  const OrangeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 300),
      child: Container(
        width: w,
        height: h / 5,
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ComponentsOfPurpleSection(
              title: Text(
                Get.find<DiscountController>()
                    .calDiscount(Get.find<CartController>().totalAmount()),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Discount",
            ),
            ComponentsOfPurpleSection(
              title: Text(
                "${Get.find<CartController>().cartFood.length}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              subtitle: "Total Items",
            ),
            ComponentsOfPurpleSection(
              title: Text(
                "Rp\n${Get.find<CartController>().totalAmount().toInt().toStringAsFixed(3)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: "Total price",
            ),
          ],
        ),
      ),
    );
  }
}

/// Components of Purple Section Widget Components
class ComponentsOfPurpleSection extends StatelessWidget {
  Text title;
  String subtitle;
  //
  ComponentsOfPurpleSection(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: w / 3.7,
        height: h / 7.3,
        decoration: BoxDecoration(
            color: unSelectedColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              child: title,
              delay: const Duration(milliseconds: 450),
            ),
            const SizedBox(
              height: 5,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Text(subtitle,
                  style: const TextStyle(color: unSelectedColor, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Top User Section Info Widget Components
class TopUserInfo extends StatelessWidget {
  const TopUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: w,
          height: h / 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 40,
                  ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kiki Faisal",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "kikifaisal101997@gmail.com",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// User profile Section AppBar
class UserProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const UserProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: () {
              Get.find<NavigatorController>().changeNavBarIndex(1);
            },
            icon: const Icon(
              LineIcons.shoppingCart,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
