import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class GridCard extends StatelessWidget {
  const GridCard(
      {super.key,
      required this.listOrGrid,
      required this.name,
      required this.image});
  final String name;
  final bool listOrGrid;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Image(
                    width: double.infinity,
                    image: AssetImage('assets/images/$image')),
              ),
              Flexible(
                  flex: 2,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                  )),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors().mainAppColor),
                      minimumSize: MaterialStateProperty.all(const Size(
                          double.infinity, double.minPositive + 50))),
                  onPressed: (() {}),
                  child: const Text(
                    'Info',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
