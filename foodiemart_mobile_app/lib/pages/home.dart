
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import '../controllers/navigator_controllers.dart';
import '../controllers/food_controller.dart';
import '../controllers/switch_controller.dart';
import '../pages/details.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: mainDrawer(3),
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopTextWidget(),
                SizedBox(
                height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('New Taste', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                MiddleSaladsPageView(),
                SizedBox(
                height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Popular', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                BottomSaladGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Bottom Salad GridView Widget Components
class BottomSaladGridView extends StatelessWidget {
  const BottomSaladGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<FoodController>();
    return SizedBox(
      width: w,
      height: h,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: _foodController.salads.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.currentSaladIndex = index;
                Get.to(() => const DetailsPage());
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 10,
                      child: Container(
                          width: w / 2.4,
                          height: h / 4,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      
                    ),
                    Positioned(
                      top: 10,
                     child: SizedBox(
                            width: w / 3,
                            height: h / 7,
                            child: Center(
                              child: Image.asset(
                                _foodController.salads[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        
                      
                    ),
                    Positioned(
                      top: 130,
                      child: SizedBox(
                          width: w / 2.7,
                          height: h / 30,
                          child: Center(
                            child: Text(
                              _foodController.salads[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                        ),
                      
                    ),
                    Positioned(
                      top: 155,
                      child: Text(
                          _foodController.salads[index].subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      
                    ),
                    Positioned(
                      left: 40,
                      top: 170,
                      child: Text(
                          "Rp${_foodController.salads[index].price.toStringAsFixed(3)}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/// Middle Salads PageView Widget Components
class MiddleSaladsPageView extends StatelessWidget {
  const MiddleSaladsPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<SwitchController>();
    var _foodController = Get.find<FoodController>();
    return SizedBox(
        width: w,
        height: h / 4.5,
        child: PageView.builder(
            itemCount: _foodController.salads.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _controller.currentSaladIndex = index;
                  Get.to(() => const DetailsPage());
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: w / 1.1,
                  child: Stack(children: [
                    Positioned(
                      bottom: 10,
                      right: 0,
                     child: Container(
                          width: w / 1.3,
                          height: h / 5.5,
                          decoration: BoxDecoration(
                              color: unSelectedColor,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      
                    ),
                    Positioned(
                      bottom: 3,
                      left: 5,
                      child: SizedBox(
                            width: w / 2.5,
                            height: h / 5,
                            child: Hero(
                              tag: _foodController.salads[index].id,
                              child: Image.asset(
                                _foodController.salads[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        
                      
                    ),
                    Positioned(
                      left: 175,
                      top: 40,
                     child: Text(
                          _foodController.salads[index].title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                        ),
                      
                    ),
                    Positioned(
                      left: 175,
                      top: 68,
                      child: Text(
                          _foodController.salads[index].subtitle,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 135, 134, 134),
                              fontWeight: FontWeight.w300,
                              fontSize: 16),
                        ),
                      
                    ),
                    Positioned(
                      left: 175,
                      top: 95,
                      child: Text(
                          "Rp${_foodController.salads[index].price.toStringAsFixed(3)}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      
                    ),
                   
                  ]),
                ),
              );
            }));
  }
}

/// Top Text Widget Components
class TopTextWidget extends StatelessWidget {
  const TopTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: w,
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "FoodMarket",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Find Your Food",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
  }
}

/// MyAppBar Widget Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppBar(
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
            padding: const EdgeInsets.fromLTRB(0, 2, 10, 2),
            child: GestureDetector(
              onTap: () {
                Get.find<NavigatorController>().changeNavBarIndex(2);
              },
              child: const CircleAvatar(
                radius: 25,
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
