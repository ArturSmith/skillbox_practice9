import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/json_files/hotel.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/cards_view.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/hotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePage> {
  bool bedOrBar = true;
  bool listOrGrid = true;
  List<HotelPreview> hotelsPreview = [];
  List<Hotel> hotels = [];
  bool isLoading = false;
  DioError? errorResponse;

  void getData() async {
    const String url =
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
    setState(() {
      isLoading = false;
    });
    try {
      final Dio dio = Dio();
      final dioRequest = await dio.get(url);
      List<dynamic> response = dioRequest.data;
      hotelsPreview =
          response.map((hotel) => HotelPreview.fromJson(hotel)).toList();
      // hotels = hotelsPreview.map((hotelInfo) => Hotel(hotelInfo.uuid)).toList();

      setState(() {
        errorResponse = null;
      });
    } on DioError catch (e) {
      setState(() {
        errorResponse = e;
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
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: AppColors().mainAppColor,
          title: bedOrBar ? const Text('Отели') : const Text('Бары'),
          centerTitle: true,
          actions: [
            IconButton(
              color: listOrGrid ? Colors.black : Colors.white,
              onPressed: (() {
                setState(() {
                  listOrGrid = false;
                });
              }),
              icon: const Icon(Icons.grid_view),
            ),
            IconButton(
                color: listOrGrid ? Colors.white : Colors.black,
                onPressed: (() {
                  setState(() {
                    listOrGrid = true;
                  });
                }),
                icon: const Icon(Icons.list)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            setState(() {
              bedOrBar = !bedOrBar;
            });
          }),
          backgroundColor: AppColors().mainAppColor,
          child: bedOrBar
              ? const Icon(
                  Icons.sports_bar,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.bed,
                  color: Colors.white,
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: CardsView(
            listOrGrid: listOrGrid,
            hotels: hotelsPreview,
            isLoading: isLoading));
  }
}
