import 'package:deep_shield_hack/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:deep_shield_hack/models/dorm_list.dart';
import 'package:deep_shield_hack/pages/home/dormitory_card.dart';
import 'package:deep_shield_hack/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dorm {
  final String image;
  final String title;
  final String city;
  final List<int> date;
  final List<int> price;

  Dorm(
      {required this.image,
      required this.title,
      required this.city,
      required this.date,
      required this.price});
}

class StartPage extends StatefulWidget with NavigationStates {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final dormListModel = DormListModel();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    dormListModel.loadDorms();
  }

  final List<Dorm> dorms = [
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/EnEGonPS7E-20132f0223c6fe9a124c48abb2c727566bafe9da553a15d1c3488e5db7d4e92b.jpg",
      title: "Общежитие АГГПУ имени В.М. Шукшина",
      city: "Бийск",
      date: [2, 5],
      price: [100, 300],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/WP4DAJc9Vn-1c2ce7ef315edf2c61867d5d6ce367bc5ce6779dc896250050562d8000bd29c6.jpeg",
      title: "Общежитие  №1",
      city: "Москва",
      date: [2, 10],
      price: [200, 500],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/h8sitAOGtx-790fabc4194dc9627fac614773a6e877c8893411ce33f7a08d21698a367f9140.jpg",
      title: "Общежитие АлтГТУ №1",
      city: "Барнаул",
      date: [2, 7],
      price: [40, 200],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/DbZwIW7dqN-20c8886b0f4f966a48fb7e7f45830c509944126b9bc3888881b8dcc9f668ec8d.jpg",
      title: "Общежитие КГУ №1",
      city: "Курган",
      date: [3, 10],
      price: [100, 200],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/pogA6qQPsN-57ce977758c8228d5c1b41c10b192565406a9c449f564bcfc3b9d6ba5416e367.jpg",
      title: "Общежитие № 2",
      city: "Калуга",
      date: [3, 15],
      price: [0, 0],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/tKJ4NFU2m1-dc0117f8c5fecbb4d5a8b2b278b275c2d5d69b64a3c5410b272822d4cfff67a1.jpeg",
      title: "Общежитие №4",
      city: "Красноярск",
      date: [2, 12],
      price: [0, 0],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/J70nTrpDRY-298a230bb69b16256a0785af180cceb3b6925ef1de11b63c8fcebd1458b906cc.jpg",
      title: "Общежитие ОрГМУ №1",
      city: "Оренбург",
      date: [3, 10],
      price: [50, 100],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/hHsRxz5H7U-9e484f51036212684a5bf23910b8e0da91b1539dcde7d23cd92e7b24d31d95bc.jpg",
      title: "Общежитие ТвГУ, корпус 4-5",
      city: "Тверь",
      date: [2, 7],
      price: [100, 100],
    ),
    Dorm(
      image:
          "https://stud-files.sabir.pro/files/xHTTq9Ft89-dba8a137b62046be4d6cd4c6f9f1bbefb2073b5875e8d6141ba3de10412e6abd.jpg",
      title: "Общежитие КГМУ 1",
      city: "Курск",
      date: [1, 5],
      price: [20, 100],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 40),
        itemCount: dorms.length,
        // itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          final dorm = dorms[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: DormitoryCard(
              image: dorm.image,
              title: dorm.title,
              city: dorm.city,
              date: dorm.date,
              price: dorm.price,
            ),
          );
        },
      ),
    );
  }
}
