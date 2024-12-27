// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:helep2/models/place.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Detail'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(event.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF54392D),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF936B4F),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  event.date,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF936B4F),
                  ),
                ),
                // Center(
                //     child:
                //         ElevatedButton(onPressed: () {}, child: Text('Join'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
