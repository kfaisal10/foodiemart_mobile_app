import 'package:get/get.dart';
//
import '../model/salads_model.dart';

class FoodController extends GetxController {
  List<SaladModel> salads = [
    SaladModel(
      id: "1",
      img: "assets/images/1.png",
      title: "Mie Ayam",
      subtitle: "+ Kerupuk",
      price: 12.000,
      deliveryTime: "15 min",
      description:
          "Mi ayam adalah hidangan khas Indonesia yang terbuat dari mi gandum yang dibumbui dengan daging ayam yang biasanya dipotong dadu. Hidangan ini banyak terpengaruh dengan teknik penyajian kuliner yang digunakan dalam hidangan Tionghoa",
      quantity: 1,
    ),
    SaladModel(
      id: "2",
      img: "assets/images/2.png",
      title: "Ayam Geprek",
      subtitle: "+ Nasi",
      price: 18.000,
      deliveryTime: "20 min",
      description:
          "Ayam Geprek adalah hidangan ayam goreng tepung yang berasal dari Indonesia, yang ditumbuk atau dihancurkan dan disajikan dengan sambal pedas. Secara harfiah, \"geprek\" dalam bahasa Jawa berarti \"dihancurkan\" atau \"ditekan-tekan\", yang mengacu pada cara pengolahan ayamnya. Ayam Geprek terbuat dari potongan daging ayam yang diolah dengan tepung dan rempah-rempah khas Indonesia, kemudian digoreng hingga kecoklatan dan renyah.",
      quantity: 1,
    ),
    SaladModel(
      id: "3",
      img: "assets/images/3.png",
      title: "Nasi Goreng",
      subtitle: "+ Telur Ceplok",
      price: 13.000,
      deliveryTime: "10 min",
      description:
          "Nasi goreng adalah makanan berupa nasi yang digoreng dan dicampur dalam minyak goreng, margarin, atau mentega. Biasanya ditambah dengan kecap manis, bawang merah, bawang putih, asam jawa, lada dan bahan lainnya; seperti telur, daging ayam, dan kerupuk.",
      quantity: 1,
    ),
    SaladModel(
      id: "4",
      img: "assets/images/4.png",
      title: "Pecel Lele",
      subtitle: "+ Nasi",
      price: 15.000,
      deliveryTime: "7 min",
      description:
          "Pecel lele atau pecek lele adalah sebuah makanan khas Jawa Timur, Indonesia, yang terdiri dari ikan lele dan sambal tomat. Biasanya, pecel lele berupa ikan lele yang digoreng kering dengan minyak, lalu disajikan dengan sambal tomat dan lalapan. Lalapan biasa terdiri dari kemangi, kubis, mentimun, dan kacang panjang.",
      quantity: 1,
    ),
  ];

  // For add 1 item from quantityes of Food
  void addQ(int index) {
    if (salads[index].quantity < 9 && salads[index].quantity >= 0) {
      salads[index].quantity++;
    } else {
      Get.snackbar("Notice", "You can't add more than 9 item!");
    }
    update(["quantity"]);
  }

  // For remove 1 item from quantityes of Food
  void removeQ(int index) {
    if (salads[index].quantity > 1 && salads[index].quantity <= 9) {
      salads[index].quantity--;
    } else {
      Get.snackbar("Notice", "You can't order 0 item!");
    }
    update(["quantity"]);
  }
}
