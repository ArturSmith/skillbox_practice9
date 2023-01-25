import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class Cards extends StatelessWidget {
  const Cards(
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
      padding: const EdgeInsets.all(15.0),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: listOrGrid
              ? Column(
                  children: [
                    // ignore: unnecessary_null_comparison
                    image != '' ? Image.asset(image) : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                name,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors().mainAppColor),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(double.maxFinite, 40)),
                                ),
                                onPressed: (() {}),
                                child: const Text('Information')),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: image != '' ? Image.asset(image) : Container()),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          name,
                          style: const TextStyle(color: Colors.black),
                          softWrap: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors().mainAppColor),
                            minimumSize: MaterialStateProperty.all(const Size(
                                double.maxFinite, double.minPositive)),
                          ),
                          onPressed: (() {}),
                          child: const Text('Information')),
                    ),
                  ],
                )),
    );
  }
}
