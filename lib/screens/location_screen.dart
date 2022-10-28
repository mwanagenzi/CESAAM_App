import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationTab extends StatefulWidget {
  const LocationTab({Key? key}) : super(key: key);

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  // final locationService = NewsAndLocationServiceProvider();
  final Map<String, Marker> _markers = {};
  static const String locationName = 'CESAAM Office - Egerton University';

  Future<void> _onMapCreated(GoogleMapController mapController) async {
    // final helpOffices = await locationService.fetchLocationPins();
    // final helpOfficesLocations =
    //     helpOffices.fold<List<Location>>((l) => l, (r) {
    //   print(r);
    //   return [];
    // });
    setState(() {
      _markers.clear();
      // for (final office in helpOfficesLocations) {
      // -0.363301, 35.923572
      final marker = Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          -0.363301,
          35.923572,
        ),
        infoWindow: InfoWindow(title: locationName),
      );
      _markers['1'] = marker;
      // }
    });
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    tilt: 45,
    target: LatLng(-0.369273, 35.931386),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      buildingsEnabled: true,
      compassEnabled: true,
      zoomGesturesEnabled: true,
      tiltGesturesEnabled: true,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      initialCameraPosition: _initialCameraPosition,
      onMapCreated: _onMapCreated,
      markers: _markers.values.toSet(),
    );
  }
}
