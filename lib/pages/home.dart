import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:helep2/misc/tile_provider.dart';
import 'package:helep2/widgets/myBottonSheet.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Alignment alignment = Alignment.topCenter;
  bool counterRotate = false;
  final DraggableScrollableController sheetController = DraggableScrollableController();

  late final customMarkers = <Marker>[
    buildPin(const LatLng(1.561661487586152, 103.63228560201078), "Arked Cengal"),
    buildPin(const LatLng(1.5597947069943472, 103.63727775040542), "He & She Coffee UTM Johor"),
  ];

  Marker buildPin(LatLng point, String name) => Marker(
        width: 60.0,
        height: 60.0,
        point: point,
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(name),
              duration: const Duration(seconds: 1),
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
      body: Stack(
        children: [
          Flexible(
            child: FlutterMap(
              options: const MapOptions(
                initialZoom: 15.0,
                initialCenter: LatLng(1.560271740407464, 103.63822277818102),
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
          ), 
          bottomSheet(),
        ],
      ),
    );
  }
}

