import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';

class TopRowChildren extends StatefulWidget {
  const TopRowChildren({super.key, required this.childText});
  final String childText;
  @override
  State<TopRowChildren> createState() => _TopRowChildrenState();
}

class _TopRowChildrenState extends State<TopRowChildren> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all(AppColors().mainAppColor)
              : MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black))),
        ),
        child: Text(
          widget.childText,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
