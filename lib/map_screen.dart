import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  final Position userPosition;
  final String languageCode;
  final Function(String) _t;

  const MapScreen({
    Key? key,
    required this.userPosition,
    required this.languageCode,
    required Function(String) t,
  }) : _t = t, super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  // Mock data for nearby bus stops
  // In a real app, you would fetch this from an API
  final List<Map<String, dynamic>> _nearbyBusStops = [
    {
      'id': 'stop1',
      'name': 'Main Street Stop',
      'position': const LatLng(0, 0), // Will update in initState
      'routes': ['1', '5', '8'],
    },
    {
      'id': 'stop2',
      'name': 'Central Avenue Stop',
      'position': const LatLng(0, 0), // Will update in initState
      'routes': ['2', '7'],
    },
    {
      'id': 'stop3',
      'name': 'Park Road Stop',
      'position': const LatLng(0, 0), // Will update in initState
      'routes': ['3', '9', '11'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  void _initializeMap() {
    // Initialize your user location marker
    _markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        infoWindow: InfoWindow(title: widget._t('myLocation')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    // Add a circle around user location
    _circles.add(
      Circle(
        circleId: const CircleId('user_radius'),
        center: LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        radius: 500, // 500 meters radius
        fillColor: Colors.blue.withOpacity(0.2),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      ),
    );

    // Initialize nearby bus stops (simulated data)
    for (var stop in _nearbyBusStops) {
      // Create simulated positions around the user's location
      // In a real app, you would use actual bus stop coordinates
      final stopLat = widget.userPosition.latitude + (0.002 * (_nearbyBusStops.indexOf(stop) + 1));
      final stopLng = widget.userPosition.longitude + (0.001 * (_nearbyBusStops.indexOf(stop) + 1));

      stop['position'] = LatLng(stopLat, stopLng);

      _markers.add(
        Marker(
          markerId: MarkerId(stop['id']),
          position: stop['position'],
          infoWindow: InfoWindow(
            title: stop['name'],
            snippet: '${widget._t('routes')}: ${stop['routes'].join(', ')}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._t('nearbyBusStops')),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _goToUserLocation,
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
              zoom: 15,
            ),
            onMapCreated: (controller) => _mapController = controller,
            markers: _markers,
            circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            compassEnabled: true,
            zoomControlsEnabled: false,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget._t('nearbyBusStops'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._nearbyBusStops.map((stop) => _buildBusStopItem(stop)).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusStopItem(Map<String, dynamic> stop) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () => _goToLocation(stop['position']),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stop['name'],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${widget._t('routes')}: ${stop['routes'].join(', ')}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.directions, size: 20),
              onPressed: () => _showDirections(stop['position']),
              tooltip: widget._t('directions'),
            ),
          ],
        ),
      ),
    );
  }

  void _goToUserLocation() {
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        15,
      ),
    );
  }

  void _goToLocation(LatLng position) {
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }

  void _showDirections(LatLng destination) {
    // In a real app, you would implement directions using Google's Directions API
    // This is a placeholder to show how you might approach it
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(widget._t('directionsNotAvailable'))),
    );

    // To implement directions, you would:
    // 1. Use a package like flutter_polyline_points to get route points
    // 2. Draw polylines on the map using these points
    // 3. Show directions steps in a bottom sheet or separate screen
  }
}