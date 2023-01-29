import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.name, required this.image});
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shadowColor: AppColors().mainAppColor,
      elevation: 8,
      color: Colors.transparent,
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 10,
                child: Image(image: AssetImage('assets/images/$image')),
              ),
              Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.transparent)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors().mainAppColor),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.maxFinite, double.maxFinite))),
                    onPressed: (() {}),
                    child: const Text(
                      'Info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
