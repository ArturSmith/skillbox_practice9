import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/home_page/home_page_body/home_page_body.dart';
import 'package:flutter_practice9/home_page/home_page_body/top_row_children.dart';
import 'package:flutter_practice9/json_files/hotel.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  List<HotelPreview> hotels = [];
  DioError? errorResponse;
  final List<Widget> topRow = const [
    TopRowChildren(childText: 'hotels'),
    TopRowChildren(childText: 'rooms'),
    TopRowChildren(childText: 'condominiums'),
    TopRowChildren(childText: 'apartments'),
    TopRowChildren(childText: 'houses'),
  ];

  void getData() async {
    const String url =
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';

    try {
      final Dio dio = Dio();
      // ignore: prefer_const_declarations
      final dioRequest = await dio.get(url);
      List<dynamic> response = dioRequest.data;
      hotels = response.map((hotel) => HotelPreview.fromJson(hotel)).toList();
      setState(() {
        errorResponse = null;
      });
    } on DioError catch (e) {
      setState(() {
        errorResponse = e;
      });
    }
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
          body: errorResponse == null
              ? HomePageBody(topRow: topRow, hotels: hotels)
              : Center(
                  child: Text("Error $errorResponse"),
                )),
    );
  }
}
