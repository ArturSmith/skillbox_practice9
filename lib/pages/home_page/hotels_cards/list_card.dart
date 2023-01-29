import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.name, required this.image});
  final String name;
  final String image;

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
            Image(image: AssetImage('assets/images/$image')),
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
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ))),
                  Flexible(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(
                            double.minPositive, double.minPositive + 30)),
                      ),
                      onPressed: (() {}),
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
