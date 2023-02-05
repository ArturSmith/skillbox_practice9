import 'package:flutter/material.dart';
import 'package:flutter_practice9/api/api_hotel.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/json_files/hotel_preview.dart';
import 'package:flutter_practice9/views/grid_view/grid_card.dart';

class GridViewHotels extends StatelessWidget {
  const GridViewHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiHotel().getHotel(
            'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'),
        builder: ((context, AsyncSnapshot snapshot) {
          final List<HotelPreview> hotelPreview =
              snapshot.hasData ? snapshot.data : [];
          final listOfGridCards = hotelPreview
              .map(
                  (e) => GridCard(name: e.name, poster: e.poster, uuid: e.uuid))
              .toList();
          return snapshot.hasData
              ? GridView.count(crossAxisCount: 2, children: listOfGridCards)
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors().mainAppColor,
                  ),
                );
        }));
  }
}
