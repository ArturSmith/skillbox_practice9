import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/pages/home_page/views/carousel_view/carousel_slider_view.dart';

class ListCard extends StatefulWidget {
  const ListCard(
      {super.key,
      required this.name,
      required this.poster,
      required this.uuid});
  final String name;
  final String poster;
  final String uuid;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  void showInfo() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => CarouselSliderView(uuid: widget.uuid)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shadowColor: AppColors().mainAppColor,
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/${widget.poster}')),
            Container(
              height: 2,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    widget.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ))),
                  Flexible(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(
                            double.minPositive, double.minPositive + 30)),
                      ),
                      onPressed: (() {
                        showInfo();
                      }),
                      child: Text(
                        'Info',
                        style: TextStyle(color: AppColors().mainAppColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
