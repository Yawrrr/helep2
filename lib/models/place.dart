import 'package:latlong2/latlong.dart';

List<Place> places = [
  Place(
      type: 'Dining',
      name: 'Arked Meranti',
      image: 'assets/images/dining/ArkedMeranti.jpg',
      location: 'Kolej Kediaman Meranti, Universiti Putra Malaysia',
      description:
          'Arked Meranti is a place where students can buy food and drinks. It is located in Kolej Kediaman Meranti, UPM.',
      operatingHours: '8:00 AM - 10:00 PM',
      contact: '012-3456789',
      email: 'meranti@gmail.com'),
  Place(
      type: 'Dining',
      name: 'He & She Coffee UTM Johor',
      image: 'assets/images/dining/He&SheCoffeeUTM.jpg',
      location: 'Universiti Teknologi Malaysia, Johor',
      description:
          'He & She Coffee UTM Johor is a place where students can buy food and drinks. It is located in Universiti Teknologi Malaysia, Johor.',
      operatingHours: '8:00 AM - 10:00 PM',
      contact: '012-3456789',
      email: 'email@gmail.com'),
  Place(
    type: 'Dining',
    name: 'Arked Cengal',
    image: 'assets/images/dining/ArkedCengal.jpg',
    location: 'Kolej Kediaman Cengal, Universiti Putra Malaysia',
    description:
        'Arked Cengal is a place where students can buy food and drinks. It is located in Kolej Kediaman Cengal, UPM.',
    operatingHours: '8:00 AM - 10:00 PM',
    contact: '012-3456789',
    email: 'email@gmail.com'
  ),
  Place(
    type: 'Faculty',
    name: 'Faculty of Computing',
    image: 'assets/images/faculty/FacultyOfComputing.jpg',
    operatingHours: '8:00 AM - 10:00 PM',
    contact: '+6075538827',
    email: 'computing@utm.my',
    facebookLink: 'https://www.facebook.com/computing.utm/',
    instagramLink: 'https://www.instagram.com/computing.utm/',
    location: 'Universiti Teknologi Malaysia, Johor',
    upcomingEvents: [
      Event(
          name: 'Hackathon',
          description:
              'A hackathon is a design sprint-like event in which computer programmers and others involved in software development, including graphic designers, interface designers, project managers, domain experts, and others collaborate intensively on software projects.',
          image: 'assets/images/events/hackathon.png',
          location: 'Faculty of Computing, UTM Johor',
          date: '12/12/2021',
          time: '9:00 AM - 5:00 PM',
          venue: 'Lecture Hall 1'),
      Event(
          name: 'Workshop on Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          image: 'assets/images/events/FlutterWorkshop.png',
          location: 'Faculty of Computing, UTM Johor',
          date: '15/12/2021',
          time: '9:00 AM - 5:00 PM',
          venue: 'Lecture Hall 2'),
    ],
  ),
  Place(
    type: 'Facility',
    name: 'Perpustakaan UTM',
    image: 'assets/images/facility/PerpustakaanUTM.jpg',
    location: 'Universiti Teknologi Malaysia, Johor',
    operatingHours: '8:00 AM - 10:00 PM',
    contact: '012-3456789'),
  Place(
    type: 'Facility',
    name: 'Dewan Sultan Iskandar',
    image: 'assets/images/facility/DewanSultanIskandar.jpg',
    location: 'Universiti Teknologi Malaysia, Johor',
    operatingHours: '8:00 AM - 10:00 PM',
    contact: '012-3456789'),
];

class Place {
  final String type;
  final String name;
  String description;
  String image;
  final String location;
  final String operatingHours;
  final String contact;
  final String email;
  final String website;
  final String facebookLink;
  final String instagramLink;
  List<Event> upcomingEvents;
  final List<Stall> stalls;
  final LatLng coordinates = const LatLng(0, 0);

  Place(
      {required this.type,
      required this.name,
      required this.image,
      required this.location,
      this.description = '',
      this.operatingHours = '',
      this.contact = '',
      this.email = '',
      this.website = '',
      this.facebookLink = '',
      this.instagramLink = '',
      this.upcomingEvents = const [],
      this.stalls = const []});
}

class Event {
  final String name;
  final String description;
  final String image;
  final String location;
  final String date;
  final String time;
  final String venue;

  Event(
      {required this.name,
      required this.description,
      required this.image,
      required this.location,
      required this.date,
      required this.time,
      required this.venue});
}

class Stall {
  final String name;
  final String description;
  final List typeOfFood;
  final String imagePath;
  final String hours;
  final String menusPath;

  Stall(
      {required this.name,
      this.description = '',
      this.typeOfFood = const [],
      required this.imagePath,
      required this.hours,
      required this.menusPath});
}
