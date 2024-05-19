import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:helep2/misc/tile_provider.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Alignment alignment = Alignment.topCenter;
  bool counterRotate = false;

  late final customMarkers = <Marker>[
    buildPin(const LatLng(1.4680350928703532, 110.43031975451244), "Student Pavilion"),
    buildPin(const LatLng(1.4683444570750723, 110.42992594135117), "Richiamo Coffee - Unimas"),
  ];

  Marker buildPin(LatLng point, String name) => Marker(
        width: 60.0,
        height: 60.0,
        point: point,
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(name),
              duration: Duration(seconds: 1),
              showCloseIcon: true,
            ),
          ),
          child: const Icon(Icons.location_pin, size: 60, color: Colors.redAccent),
        )
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Helep2")),
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: const MapOptions(
                initialZoom: 16.0,
                initialCenter: LatLng(1.4647977635821197, 110.43105122533005),
                interactionOptions: InteractionOptions(
                  enableScrollWheel: true,
                  flags: ~InteractiveFlag.doubleTapZoom,
                ),
              ),
              children: [
                openStreetMapTileLayer,
                MarkerLayer(markers: customMarkers,alignment: alignment,),
              ],
            ),
          )
        ],
      ),
    );
  }
}