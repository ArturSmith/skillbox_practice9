import 'package:flutter/material.dart';
import 'package:flutter_practice9/api/api_hotel.dart';
import 'package:flutter_practice9/helpers/app_colors.dart';
import 'package:flutter_practice9/json_files/hotel_preview.dart';
import 'package:flutter_practice9/pages/home_page/views/list_view/list_card.dart';

class ListViewHotels extends StatelessWidget {
  const ListViewHotels({super.key});

  List<ListCard> createListCards(List<HotelPreview> hotels) {
    if (hotels.isNotEmpty) {
      return hotels
          .map((e) => ListCard(name: e.name, poster: e.poster, uuid: e.uuid))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiHotel().getHotel(
            'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'),
        builder: ((context, AsyncSnapshot snapshot) {
          return snapshot.data != null
              ? ListView(children: createListCards(snapshot.data))
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors().mainAppColor,
                  ),
                );
        }));
  }
}
