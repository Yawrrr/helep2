import 'package:flutter/material.dart';
import 'package:helep2/models/place.dart';
import 'package:helep2/pages/event_detail_page.dart';

class UpcomingEventTile extends StatelessWidget {
  final Event event;
  const UpcomingEventTile({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetailPage(event: event)));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  event.image,
                  height: 80,
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                event.name,
                style: const TextStyle(
                  color: Color(0xFF54392D),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                event.date,
                style: const TextStyle(
                    color: Color(0xFF54392D),
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
