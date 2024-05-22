import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(left:15.0, top: 15),
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
          SizedBox(height: 8,),

          //operating hours
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Color(0xFF54392D),),
                SizedBox(width: 8,),
                Text(place.operatingHours, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //contact number
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Color(0xFF54392D)),
                SizedBox(width: 8,),
                Text(place.contact, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.mail, color: Color(0xFF54392D)),
                SizedBox(width: 8,),
                Text(place.email, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //website link
          if(place.website.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.link, color: Color(0xFF54392D)),
                SizedBox(width: 8,),
                Text(place.website, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //facebook link
          if(place.facebookLink.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.facebook, color: Color(0xFF54392D)),
                SizedBox(width: 8,),
                Text(place.facebookLink, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //instagram link
          if(place.instagramLink.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.camera, color: Color(0xFF54392D)),
                SizedBox(width: 8,),
                Text(place.instagramLink, style: TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xFF54392D)),
                const SizedBox(width: 8,),
                Text(place.location, style: const TextStyle(color: Color(0xFF936B4F)),),
              ],
            ),
          ),

          //upcoming events
        ],
      ),
    );
  }
}
