import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<LocationModel>> getCharacter();
}
