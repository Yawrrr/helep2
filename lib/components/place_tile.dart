import 'package:flutter/material.dart';
import 'package:helep2/models/place.dart';
import 'package:helep2/pages/place_detail_page.dart';

class PlaceTile extends StatelessWidget {
  final Place place;
  const PlaceTile({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 0,
      color: null,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetailPage(place: place)));
        },
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(place.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
            ListTile(
              title: Text(
                place.name,
                style: const TextStyle(
                    color: Color(0xFF54392D), fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
