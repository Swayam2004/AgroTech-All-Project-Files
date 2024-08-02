import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class GetAndUpdateLocation extends StatefulWidget {
  const GetAndUpdateLocation({super.key});

  @override
  State<GetAndUpdateLocation> createState() => _GetAndUpdateLocationState();
}

class _GetAndUpdateLocationState extends State<GetAndUpdateLocation> {
  final Location _locationController = Location();
  StreamSubscription<LocationData>?
      _locationSubscription; // Allow it to be null

  String location = '';
  LocationData? _lastLocation; // Cache for the last known location

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  void dispose() {
    // Cancel the stream subscription when disposing, if it exists
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(location == "" ? "Fetching Location..." : location,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold));
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData presentLocation = await _locationController.getLocation();
    if (mounted) {
      _updateLocation(presentLocation);
    }

    _locationSubscription = _locationController.onLocationChanged.listen(
      (LocationData currentLocation) async {
        LocationData updatedLocation = await _locationController.getLocation();
        if (mounted) {
          _updateLocation(updatedLocation);
        }
      },
    );
  }

  void _updateLocation(LocationData newLocation) {
    // Check if the location has changed (using a tolerance for floating-point comparison)
    if (_lastLocation == null ||
        (_lastLocation!.latitude != newLocation.latitude ||
            _lastLocation!.longitude != newLocation.longitude)) {
      // Update the last known location
      _lastLocation = newLocation;

      // Fetch placemarks and update the UI
      getPlacemarks(newLocation.latitude!, newLocation.longitude!)
          .then((address) {
        setState(() {
          location = address;
        });
      });
    }
  }

  Future<String> getPlacemarks(double lat, double long) async {
    try {
      List<geo.Placemark> placemarks =
          await geo.placemarkFromCoordinates(lat, long);

      var address = '';

      if (placemarks.isNotEmpty) {
        // Concatenate non-null components of the address
        var streets = placemarks.reversed
            .map((placemark) => placemark.street)
            .where((street) => street != null);

        // Filter out unwanted parts
        streets = streets.where((street) =>
            street!.toLowerCase() !=
            placemarks.reversed.last.locality!
                .toLowerCase()); // Remove city names
        streets = streets
            .where((street) => !street!.contains('+')); // Remove street codes

        address += streets.join(', ');

        address += ', ${placemarks.reversed.last.subLocality ?? ''}';
        address += ', ${placemarks.reversed.last.locality ?? ''}';
        address += ', ${placemarks.reversed.last.subAdministrativeArea ?? ''}';
        address += ', ${placemarks.reversed.last.administrativeArea ?? ''}';
        address += ', ${placemarks.reversed.last.postalCode ?? ''}';
        address += ', ${placemarks.reversed.last.country ?? ''}';
      }

      print("Your Address for ($lat, $long) is: $address");

      return address;
    } catch (e) {
      print("Error getting placemarks: $e");
      return "No Address";
    }
  }
}
