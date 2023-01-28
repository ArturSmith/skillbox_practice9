import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/grid_card.dart';
import 'package:flutter_practice9/pages/home_page/hotels_cards/list_card.dart';
import 'package:flutter_practice9/json_files/hotel.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePage> {
  bool listOrGrid = true;
  bool bedOrBar = true;
  DioError? errorResponse;
  bool isLoading = false;
  List<HotelPreview> hotels = [];

  void getData() async {
    const String url =
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';
    setState(() {
      isLoading = false;
    });
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
      body: isLoading
          ? errorResponse == null
              ? listOrGrid
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListView.separated(
                          itemBuilder: ((context, index) {
                            return Functions()
                                .createListCards(hotels, listOrGrid)[index];
                          }),
                          separatorBuilder: ((context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          }),
                          itemCount: Functions()
                              .createListCards(hotels, listOrGrid)
                              .length))
                  : GridView.count(
                      crossAxisCount: 2,
                      children: Functions().createGridCards(hotels, listOrGrid),
                    )
              : Center(
                  child: Text('Error $errorResponse'),
                )
          : Center(
              child: CircularProgressIndicator(
                color: AppColors().mainAppColor,
              ),
            ),
    );
  }
}

class Functions {
  List<Widget> createListCards(List<HotelPreview> hotels, bool listOrGrid) {
    List<Widget> cards = hotels
        .map((hotel) => ListCard(
            listOrGrid: listOrGrid, name: hotel.name, image: hotel.poster))
        .toList();
    return cards;
  }

  List<Widget> createGridCards(List<HotelPreview> hotels, bool listOrGrid) {
    List<Widget> cards = hotels
        .map((hotel) => GridCard(
            listOrGrid: listOrGrid, name: hotel.name, image: hotel.poster))
        .toList();
    return cards;
  }
}
