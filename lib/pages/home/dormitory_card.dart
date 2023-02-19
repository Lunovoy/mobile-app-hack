import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class DormitoryCard extends StatefulWidget {
  DormitoryCard({
    required this.image,
    required this.title,
    required this.city,
    required this.date,
    required this.price,
    super.key,
  });
  String image;
  String title;
  String city;
  List<int> date;
  List<int> price;

  @override
  State<DormitoryCard> createState() => _DormitoryCardState();
}

class _DormitoryCardState extends State<DormitoryCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 310,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  color: Colors.black26,
                  blurRadius: 4,
                ),
              ]),
          child: Column(
            children: [
              Image.network(
                widget.image,
                height: 175,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.city,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: AppColors.subText),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                            ),
                            Text(
                                "от ${widget.date[0]} до ${widget.date[1]} дней"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/coins.svg"),
                            Text(
                                "от ${widget.price[0]}₽ до ${widget.price[1]}₽"),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "Вариантов размещения: 2",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton(
            color: Colors.red,
            icon: isLiked
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              if (isLiked) {
                isLiked = false;
              } else {
                isLiked = true;
              }
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}
