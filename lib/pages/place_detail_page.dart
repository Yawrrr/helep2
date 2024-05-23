// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helep2/models/place.dart';

class PlaceDetailPage extends StatelessWidget {
  final Place place;
  const PlaceDetailPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //images
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(place.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //place name
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Text(
              textAlign: TextAlign.left,
              place.name,
              style: const TextStyle(
                color: Color(0xFF54392D),
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),

          //operating hours
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              children: [
                SvgPicture.asset(
                    'assets/vectors/clock.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  place.operatingHours,
                  style: const TextStyle(color: Color(0xFF936B4F)),
                ),
              ],
            ),
          ),

          //contact number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              children: [
                SvgPicture.asset(
                    'assets/vectors/phone.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  place.contact,
                  style: const TextStyle(color: Color(0xFF936B4F)),
                ),
              ],
            ),
          ),

          //email
          if (place.email.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/vectors/envelope.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    place.email,
                    style: const TextStyle(color: Color(0xFF936B4F)),
                  ),
                ],
              ),
            ),

          //website link
          if (place.website.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/vectors/link.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    place.website,
                    style: const TextStyle(color: Color(0xFF936B4F)),
                  ),
                ],
              ),
            ),

          //facebook link
          if (place.facebookLink.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/vectors/facebook-logo.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    place.facebookLink,
                    style: const TextStyle(color: Color(0xFF936B4F)),
                  ),
                ],
              ),
            ),

          //instagram link
          if (place.instagramLink.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/vectors/instagram-logo.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    place.instagramLink,
                    style: const TextStyle(color: Color(0xFF936B4F)),
                  ),
                ],
              ),
            ),

          //address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              children: [
                SvgPicture.asset(
                    'assets/vectors/map-pin-area.svg',
                    height: 24,
                    color: const Color(0xFF54392D),
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  place.location,
                  style: const TextStyle(color: Color(0xFF936B4F)),
                ),
              ],
            ),
          ),

          //upcoming events
        ],
      ),
    );
  }
}
