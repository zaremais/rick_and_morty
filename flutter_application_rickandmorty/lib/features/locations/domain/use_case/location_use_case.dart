import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/repositories/location_repository.dart';

class LocationUseCase {
  LocationRepositoryImpl locationRepositoryImpl = LocationRepositoryImpl();

  Future<List<LocationModel>> getLocation() async =>
      await locationRepositoryImpl.getLocation();
}