// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helep2/components/upcomingEventTile.dart';
import 'package:helep2/models/place.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetailPage extends StatelessWidget {
  final Place place;
  PlaceDetailPage({super.key, required this.place});
  final _controller = ScrollController();
  final _scrollController = ScrollController();
  
  Widget _buildInfoRow(String assetPath, String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        children: [
          SvgPicture.asset(
            assetPath,
            height: 24,
            color: const Color(0xFF54392D),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(color: Color(0xFF936B4F)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Place Detail'),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        child: Column(
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

            // Operating hours
          _buildInfoRow('assets/vectors/clock.svg', place.operatingHours),

          // Contact number
          _buildInfoRow('assets/vectors/phone.svg', place.contact),

          // Email
          if (place.email.isNotEmpty) _buildInfoRow('assets/vectors/envelope.svg', place.email),

          // Website link
          if (place.website.isNotEmpty) _buildInfoRow('assets/vectors/link.svg', place.website),

          // Facebook link
          if (place.facebookLink.isNotEmpty) _buildInfoRow('assets/vectors/facebook-logo.svg', place.facebookLink),

          // Instagram link
          if (place.instagramLink.isNotEmpty) _buildInfoRow('assets/vectors/instagram-logo.svg', place.instagramLink),


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
                  GestureDetector(
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=${place.coordinates.latitude},${place.coordinates.longitude}')),
                    child: Text(
                      place.location,
                      style: const TextStyle(color: Color(0xFF936B4F)),
                    ),
                  ),
                ],
              ),
            ),
            //upcoming events
            if (place.upcomingEvents.isNotEmpty)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Upcoming Events',
                        style: TextStyle(
                          color: Color(0xFF54392D),
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text('View All >', style: TextStyle(color: Color(0xFF936B4F), fontSize: 12),),
                        )),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 128,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: place.upcomingEvents.length,
                      itemBuilder: (context, index) {
                        final event = place.upcomingEvents[index];
                        return UpcomingEventTile(event: event);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
