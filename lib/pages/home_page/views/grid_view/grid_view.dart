import 'package:flutter/material.dart';
import 'package:flutter_practice9/api/api_hotel.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/json_files/hotel_preview.dart';
import 'package:flutter_practice9/pages/home_page/views/grid_view/grid_view_card.dart';

class GridViewHotels extends StatelessWidget {
  const GridViewHotels({super.key});

  List<GridCard> createGridCards(List<HotelPreview>? hotels) {
    List<GridCard> gridCards = [];

    gridCards = hotels!
        .map((e) => GridCard(name: e.name, poster: e.poster, uuid: e.uuid))
        .toList();

    return gridCards;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiHotel().getHotel(
            'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'),
        builder: ((context, snapshot) {
          return snapshot.data != null
              ? GridView.count(
                  crossAxisCount: 2, children: createGridCards(snapshot.data))
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors().mainAppColor,
                  ),
                );
        }));
  }
}
