import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/features/locations/domain/repositories/location_reposotory.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/api_requester.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<List<LocationModel>> getLocation() async {
    try {
      APIRequester requester = APIRequester();
      Response response = await requester.toGet('/location');
      log('location result ==== ${response.data["results"]}');

      if (response.statusCode == 200) {
        List<LocationModel> locationModelList = response.data["results"]
            .map<LocationModel>((el) => LocationModel.fromJson(el))
            .toList();

        return locationModelList;
      } else {
        throw ErrorsEnum.invalidError;
      }
    } catch (e) {
      log(e.toString());

      throw ErrorsEnum.invalidError;
    }
  }
}
