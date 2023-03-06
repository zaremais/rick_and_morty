import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';

abstract class LocationRepository {
  Future<List<LocationModel>> getLocation();
}
