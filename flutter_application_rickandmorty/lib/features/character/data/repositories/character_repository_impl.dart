import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_application_rickandmorty/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/api_requester.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  @override
  Future<List<LocationModel>> getCharacter() async {
    try {
      APIRequester requester = APIRequester();
      Response response = await requester.toGet('/character');
      log('characters result ==== ${response.data}');

      if (response.statusCode == 200) {
        List<LocationModel> characterModelList = response.data['results']
            .map<LocationModel>((el) => LocationModel.fromJson(el))
            .toList();

        return characterModelList;
      } else {
        throw ErrorsEnum.invalidError;
      }
    } catch (e) {
      log(e.toString());

      throw ErrorsEnum.invalidError;
    }
  }
}
