import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class ListCard extends StatelessWidget {
  const ListCard(
      {super.key,
      required this.listOrGrid,
      required this.name,
      required this.image});
  final String name;
  final bool listOrGrid;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors().mainBacgraundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/$image')),
          Container(
            height: 1,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Center(child: Text(name))),
                Flexible(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors().mainAppColor),
                    ),
                    onPressed: (() {}),
                    child: const Text(
                      'Info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
