import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/home_page/home_page_body.dart';
import 'package:flutter_practice9/home_page/top_row_children.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final List<Widget> children = [];

  bool listOrGrid = true;

  final List<Widget> topRow = const [
    TopRowChildren(childText: 'hotels'),
    TopRowChildren(childText: 'rooms'),
    TopRowChildren(childText: 'condominiums'),
    TopRowChildren(childText: 'apartments'),
    TopRowChildren(childText: 'houses'),
  ];

  bool isLoading = false;
  bool errorResponce = false;

  void getData() async {
    setState(() {
      isLoading = false;
    });

    try {
      final request = await Dio()
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

      // final json = jsonDecode(request);
    } catch (e) {
      setState(() {
        errorResponce = true;
      });
    }

    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? errorResponce
                ? HomePageBody(
                    listOrGrid: listOrGrid, topRow: topRow, children: children)
                : const Center(child: Text('Error 404'))
            : Center(
                child: CircularProgressIndicator(
                  color: AppColors().mainAppColor,
                ),
              ),
      ),
    );
  }
}
